import fs from "fs"
import path from "path"
import matter from "gray-matter"

export async function getContent(
  collection: string,
  slug: string
) {
  const filePath = path.join(
    process.cwd(),
    "content",
    collection,
    `${slug}.md`
  )

  const source = fs.readFileSync(
    filePath,
    "utf8"
  )

  const { data, content } =
    matter(source)

  return {
    meta: data,
    content
  }
}
