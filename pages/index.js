import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>Mazi NFT</title>
        <meta name="description" content="MAZI NFT" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <span className={styles.App_header}>
      <Image src="/odogwu.svg" alt="Odogwu" width={750} height={750} className={styles.App_logo} />
      </span>
    </div>
  )
}



