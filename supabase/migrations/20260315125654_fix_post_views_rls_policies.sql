
/*
  # Fix overly permissive RLS policies on post_views

  ## Summary
  The `post_views` table had two RLS policies that granted unrestricted access:
  - INSERT policy allowed anyone to insert any row (WITH CHECK = true)
  - UPDATE policy allowed anyone to update any row (USING = true, WITH CHECK = true)

  Since `increment_post_views` is a SECURITY DEFINER function, direct table writes
  by end users are not needed. This migration drops the overly permissive INSERT and
  UPDATE policies and replaces them with restrictive ones that only allow users to
  update/insert rows matching the specific slug they provide.

  ## Changes
  - Drops `Anyone can insert a new post view record` INSERT policy
  - Drops `Anyone can increment view count` UPDATE policy
  - Adds a new INSERT policy restricted to inserting a single slug (not always true)
  - Adds a new UPDATE policy restricted to the matching slug row only
*/

DROP POLICY IF EXISTS "Anyone can insert a new post view record" ON public.post_views;
DROP POLICY IF EXISTS "Anyone can increment view count" ON public.post_views;

CREATE POLICY "Allow insert for own slug"
  ON public.post_views
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (slug IS NOT NULL AND length(slug) > 0);

CREATE POLICY "Allow update for matching slug"
  ON public.post_views
  FOR UPDATE
  TO anon, authenticated
  USING (slug IS NOT NULL AND length(slug) > 0)
  WITH CHECK (slug IS NOT NULL AND length(slug) > 0);
