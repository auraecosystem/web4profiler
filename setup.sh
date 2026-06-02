#!/bin/bash

echo "🚀 Creating QUBUHUB..."

npx create-next-app@latest qubuhub \
--typescript \
--tailwind \
--eslint \
--app \
--src-dir \
--import-alias "@/*"

cd qubuhub

echo "📦 Installing packages..."

npm install \
gray-matter \
@next/mdx \
@mdx-js/loader \
@mdx-js/react \
next-mdx-remote \
remark-gfm \
remark-frontmatter \
rehype-slug \
rehype-autolink-headings \
zod \
clsx \
lucide-react

echo "📁 Creating folders..."

mkdir -p content/products
mkdir -p content/ai
mkdir -p content/agents
mkdir -p content/blockchain
mkdir -p content/docs
mkdir -p content/blog
mkdir -p content/changelog
mkdir -p content/startups
mkdir -p content/marketplace
mkdir -p content/prompts

mkdir -p public/products
mkdir -p public/uploads
mkdir -p public/docs
mkdir -p public/ai

mkdir -p src/components/ui
mkdir -p src/components/cards
mkdir -p src/components/mdx
mkdir -p src/components/dashboard
mkdir -p src/components/editor

mkdir -p src/lib/content
mkdir -p src/lib/search
mkdir -p src/lib/vector
mkdir -p src/lib/ai
mkdir -p src/lib/analytics

echo "⚙️ Creating next.config.mjs..."

cat > next.config.mjs << 'EOF'
import createMDX from "@next/mdx"

const withMDX = createMDX({
  extension: /\.(md|mdx)$/
})

const nextConfig = {
  pageExtensions: [
    "js",
    "jsx",
    "ts",
    "tsx",
    "md",
    "mdx"
  ]
}

export default withMDX(nextConfig)
EOF

echo "⚙️ Creating mdx-components.tsx..."

cat > mdx-components.tsx << 'EOF'
import type { MDXComponents } from "mdx/types"

export function useMDXComponents(): MDXComponents {
  return {}
}
EOF

echo "📚 Creating content loader..."

cat > src/lib/content/getContent.ts << 'EOF'
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
EOF

echo "📝 Creating example content..."

cat > content/products/lamis-ai.md << 'EOF'
---
id: "lamis-ai"

type: "ai"

title: "LAMIS AI"

slug: "lamis-ai"

organization: "QUBUHUB"

description: "Realtime multimodal AI assistant."

featured: true

status: "active"

tags:
  - AI
  - GPT5
  - Vision
  - lmlm
  
pricing:
  current: 
  old: 
  currency: "USD"

media:
  hero: "/products/lamis/hero.webp"

links:
  github: "https://github.com/Web4application/LAMIS"

stats:
  users: 1500

updatedDate: "2026-06-01"
---

# LAMIS AI

Realtime multimodal intelligence.

## Features

- GPT-5
- Vision
- Voice
- Realtime Processing
EOF

echo "🌐 Creating dynamic route..."

mkdir -p src/app/products/[slug]

cat > src/app/products/[slug]/page.tsx << 'EOF'
import { getContent }
from "@/lib/content/getContent"

export default async function Page({
  params
}: {
  params: {
    slug: string
  }
}) {

  const page =
    await getContent(
      "products",
      params.slug
    )

  return (
    <main className="max-w-5xl mx-auto p-8">
      <h1 className="text-5xl font-bold">
        {page.meta.title}
      </h1>

      <p className="mt-4">
        {page.meta.description}
      </p>
    </main>
  )
}
EOF

echo "🔍 Creating search API..."

mkdir -p src/app/api/search

cat > src/app/api/search/route.ts << 'EOF'
import { NextResponse }
from "next/server"

export async function GET() {
  return NextResponse.json({
    success: true
  })
}
EOF

echo "🧠 Creating vector layer..."

cat > src/lib/vector/index.ts << 'EOF'
export async function embed(text: string) {
  return []
}
EOF

echo "🤖 Creating AI layer..."

cat > src/lib/ai/index.ts << 'EOF'
export async function generate(
  prompt: string
) {
  return prompt
}
EOF

echo "📊 Creating analytics layer..."

cat > src/lib/analytics/index.ts << 'EOF'
export async function track() {
  return true
}
EOF

echo "✅ QUBUHUB installed."

echo ""
echo "Run:"
echo ""
echo "npm run dev"
echo ""
echo "Open:"
echo ""
echo "https://127.0.0.1:3000"
mkdir my-astrohttps://github.com/auraecosystem/web4profiler
cd web4
