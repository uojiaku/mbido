import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import { Navbar, Container, Nav } from 'react-bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css';


const Home = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Mazi NFT</title>
        <meta name="description" content="MAZI NFT" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Navbar>
        <Container>
        <Navbar.Brand href="#MAZI" className={styles.ImageSettings}>MAZI NFT</Navbar.Brand>
  <Navbar.Toggle aria-controls="responsive-navbar-nav" />
    <Nav className="me-auto">
      <Nav.Link href="#Zụta">Zụta</Nav.Link>
      <Nav.Link href="#Ree">Ree</Nav.Link>
      
    </Nav>
        <Navbar.Toggle />
        <Navbar.Collapse className="justify-content-end">
        <Navbar.Text>
        Banye dị ka: <a href="#login">Odogwu</a>
       </Navbar.Text>
       </Navbar.Collapse>
       </Container>
    </Navbar>
      
      <span className={styles.App_header}>
      <Image src="/odogwu.svg" alt="Odogwu" width={750} height={750} className={styles.App_logo} />
      </span>

      <div>
      <span className={styles.App_header}>
      <Image src="/genevieve.JPG" alt="gene" width={750} height={750} className={styles.App_nothing} />
      </span>
      </div>

      <div>
      <span className={styles.App_header}>
      <Image src="/genevieve1.JPG" alt="gene1" width={750} height={750} className={styles.App_nothing} />
      </span>
      </div>

      <div>
      <span className={styles.App_header}>
      <Image src="/genevieve3.JPG" alt="gene1" width={750} height={750} className={styles.App_nothing} />
      </span>
      </div>

      <div>
      <span className={styles.App_header}>
      <Image src="/genevieve4.JPG" alt="gene1" width={750} height={750} className={styles.App_nothing} />
      </span>
      </div>

      <div>
      <span className={styles.App_header}>
      <Image src="/kolanut.jpg" alt="gene1" width={750} height={750} className={styles.App_nothing} />
      </span>
      </div>

      <div>
      <span className={styles.App_header}>
      <Image src="/palmtreeclimber.png" alt="gene1" width={750} height={750} className={styles.App_nothing} />
      </span>
      </div>

      <div>
      <span className={styles.App_header}>
      <Image src="/nigerian_pounds.jpg" alt="gene1" width={750} height={750} className={styles.App_nothing} />
      </span>
      </div>
    </div>
    
  )
}

export default Home



