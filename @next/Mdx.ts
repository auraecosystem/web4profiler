import type { MDXComponents } from "mdx/types"

export function useMDXComponents(): MDXComponents {
  return {
    h1: (props) => (
      <h1
        className="text-5xl font-bold"
        {...props}
      />
    ),

    h2: (props) => (
      <h2
        className="text-3xl font-semibold"
        {...props}
      />
    )
  }
}
