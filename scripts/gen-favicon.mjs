import fs from 'node:fs'
import path from 'node:path'
import sharp from 'sharp'
import pngToIco from 'png-to-ico'

const root = process.cwd()
const svgPath = path.join(root, 'public', 'vite.svg')
const outDir = path.join(root, 'public')
const sizes = [16, 32, 48, 64]

async function main() {
  const svg = fs.readFileSync(svgPath)
  const pngPaths = []
  for (const size of sizes) {
    const out = path.join(outDir, `favicon-${size}.png`)
    await sharp(svg)
      .resize(size, size, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
      .png()
      .toFile(out)
    pngPaths.push(out)
  }
  const ico = await pngToIco(pngPaths)
  fs.writeFileSync(path.join(outDir, 'favicon.ico'), ico)
  console.log('Generated:', ['public/favicon.ico', ...pngPaths].join(', '))
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
