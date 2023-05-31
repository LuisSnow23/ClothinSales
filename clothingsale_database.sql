-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2023 a las 07:05:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clothingsale_database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$MilDJm3l8BP.0xHChL/liOBpFEQcHaW3gejq.SuQYfs459KDgwhR.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(5, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(6000) NOT NULL,
  `category` varchar(500) NOT NULL,
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `category`, `images`, `stock`) VALUES
(1, 'Tenis Yeezy Verdes', 4500, 'Tenis deportivos modernos.', 'Tenis', 'https://media.revistagq.com/photos/5ce595fad1dca80c3ac0a131/16:9/pass/yeezy350glow.jpg', '10'),
(2, 'Tenis nike con valvula', 12000, 'Tenis nike para deporte duro.', 'Tenis deportivo', 'https://m.media-amazon.com/images/I/61Dw4zPlhzS._AC_SL1001_.jpg', '10'),
(3, 'Tenis jordan', 6500, 'Tenis resistentes, balanceados para saltar muy bien y correr para evitar el resbale.', 'Tenis deportivos', 'https://www.innvictus.com/medias/IN-DO1925-001-1.jpg?context=bWFzdGVyfGltYWdlc3wxMDMwMTB8aW1hZ2UvanBlZ3xpbWFnZXMvaGEwL2hhOS8xMTIwNjI4MjIxNTQ1NC5qcGd8ODFmNjBjMmMwMWE0YjE5NDUyNzhiZmM2MjFlNjExNWJlOTc1MTFiYjhjODg5MGViZDUxOTcyMTU5ZDRjNzcxOA', '10'),
(4, 'Tenis Yeezy Boost 350 V2', 4900, 'Tenis modernos, deportivos y ajustados para un mejor flujo de aire.', 'Tenis urban', 'https://http2.mlstatic.com/D_NQ_NP_733258-MLM53914244944_022023-O.jpg', '10'),
(5, 'Tenis Jordan Retro 11', 8900, 'Tenis con balance y anti-arrastre.', 'Tenis deportivo y coleccion', 'https://images.stockx.com/images/Air-Jordan-11-Retro-Cool-Grey-2021-Product.jpg?fit=fill&bg=FFFFFF&w=1200&h=857&fm=webp&auto=compress&dpr=2&trim=color&updated_at=1631898423&q=75', '10'),
(6, 'Tenis Nike Cortez', 3000, 'Tenis nike cortez, excelentes para rodadas nocturnas en barrios de ciudades, para caballeros.', 'Tenis urban', 'https://m.media-amazon.com/images/I/61rXtdI4VvL._AC_SL1500_.jpg', '10'),
(7, 'Sandalias Yeezy Slide', 6000, 'Sandalias perfectas para sitios urbanos, presumirlas a tus amigos y su excelente comodidad y ventilacion!.', 'Sandalias urbanas', 'https://cf.shopee.com.mx/file/9d42add46911cd7e73a4fc06dc37ea7e', '10'),
(8, 'Tenis Balenciaga Black V1', 11000, 'Tenis urbanos para correr a buenas velocidades, aptos para deportistas premium.', 'Tenis deportivos urban', 'https://http2.mlstatic.com/D_NQ_NP_787608-MLM51916841933_102022-W.jpg', '10'),
(9, 'Tenis Balenciaga Pink', 15000, 'Tenis urbanos para correr, apto para mujeres deportistas premium.', 'Tenis deportivos urban', 'https://down-mx.img.susercontent.com/file/bc70584eb54d9b487ab21999be44a760', '10'),
(10, 'Tenis Balenciaga Verde Nitro', 9000, 'Tenis urbanos perfectos para caminatas comodas y largas.', 'Tenis deportivos urban', 'https://http2.mlstatic.com/D_NQ_NP_765998-MLM53041267072_122022-W.jpg', '10'),
(11, 'Tenis Balenciaga Triple S Rainbow', 20000, 'Tenis premium urbanos perfecto para reuniones y festias de alta calidad de vida.', 'Tenis urban', 'https://http2.mlstatic.com/D_NQ_NP_765152-MLM53256863362_012023-W.jpg', '10'),
(12, 'Tenis Balenciaga Absolute Black Triple S', 16000, 'Tenis urbanos deportivos perfectos para deportistas premium o parkour.', 'Tenis deportivos urban', 'https://http2.mlstatic.com/D_NQ_NP_844798-MCO52126980451_102022-W.jpg', '10'),
(13, 'Legendary Whitetails Flush Out Sudadera Con Capucha Para Hombre', 1900, 'Calidez resistente: chamarra de lona forrada de franela suave con capucha de 3 paneles para mantener el viento fuera mientras que los bolsillos laterales de fácil acceso mantienen tus manos calientes.', 'Sudadera', 'https://m.media-amazon.com/images/I/812w2IU3iuL._AC_SL1500_.jpg', '10'),
(14, 'Cámara Canon Kit Sd16Gb', 13400, 'CANON una marca líder en el mercado, presenta en esta ocasión la Cámara Canon Kit T7EF- S18-55 +75-300+ B200+ SD16GB. ', 'Camara fotografica', 'https://resources.sears.com.mx/medios-plazavip/fotos/productos_sears1/original/3647220.jpg', '10'),
(15, 'Timex T2N677 Reloj Análogo, Color Negro', 5200, 'El reloj Timex Originals T2N677 combina una caja de acero inoxidable con baño de iones negro de forma redonda de 42 mm y una correa de cuero marrón tostado con una hebilla tradicional. Tiene una esfera analógica negra protegida por un cristal mineral. La energía es generada por el movimiento de cuarzo. Otras características incluyen luz de fondo. Este modelo también tiene una resistencia al agua de hasta 30 metros.', 'Reloj', 'https://m.media-amazon.com/images/I/71vAhRL47UL._AC_SL1500_.jpg', '10'),
(16, 'Playera Mujer Negro - Calvin Klein', 1000, 'Calvin Klein es una marca global de estilo de vida que\r\nrepresenta ideales audaces y vanguardistas, y una estética seductora y a menudo\r\nminimalista. Buscamos fascinar e inspirar a nuestra audiencia utilizando\r\nimágenes provocativas y diseños llamativos que provocan a los sentidos.', 'Playeras', 'https://http2.mlstatic.com/D_NQ_NP_2X_944186-MLM54511778541_032023-F.webp', '10'),
(17, 'Sudadera Supreme Ambigram Hoodie Original Box Logo Ss22', 7000, 'Modelo: Ambigram Hooded Sweatshirt,\r\nTemporada: SS 22.\r\nTodos nuestros productos son 100% originales, nuevos y sin defectos. Devolución total de tu dinero si no estás satisfecho con la compra.\r\n', 'Sudadera', 'https://http2.mlstatic.com/D_NQ_NP_2X_608406-MLM49549017074_042022-F.webp', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `address` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(250) NOT NULL,
  `password` varchar(200) NOT NULL,
  `code` int(11) NOT NULL DEFAULT 0,
  `expiration` int(11) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
