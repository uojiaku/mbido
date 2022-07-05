/** @type {import('next').NextConfig} */
const nextConfig = {
  //reactStrictMode: true,
  TrailingSlash: true,
  
}

//module.exports = nextConfig
module.exports = {
  experimental: {
    images: {
      unoptimized: true,
    },
  },
  nextConfig
}
/* module.exports = {
  distDir: 'out',
}
*/
