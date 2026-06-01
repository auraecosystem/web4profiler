import { getContent } from "@/lib/content"

export default async function Page({
  params
}) {
  const page = await getContent(
    "products",
    params.slug
  )

  return (
    <main>
      <h1>{page.meta.title}</h1>

      <img
        src={page.meta.media.hero}
        alt={page.meta.title}
      />

      <p>
        {page.meta.description}
      </p>
    </main>
  )
}
