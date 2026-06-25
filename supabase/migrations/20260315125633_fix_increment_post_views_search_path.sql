
/*
  # Fix mutable search_path on increment_post_views function

  ## Summary
  The function `public.increment_post_views` has a mutable search_path, which is a security
  risk. An attacker could manipulate the search_path to redirect function calls to malicious
  objects. This migration recreates the function with a fixed search_path set to `public`.

  ## Changes
  - Recreates `public.increment_post_views` with `SET search_path = public` to lock the path
*/

CREATE OR REPLACE FUNCTION public.increment_post_views(post_slug text)
  RETURNS void
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path = public
AS $$
BEGIN
  INSERT INTO post_views (slug, views, updated_at)
  VALUES (post_slug, 1, now())
  ON CONFLICT (slug) DO UPDATE
  SET views = post_views.views + 1,
      updated_at = now();
END;
$$;
