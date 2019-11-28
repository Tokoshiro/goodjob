SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

create database goodjod;
use goodjod;

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `idPerfilProfesional` int NOT NULL,
  `PPNombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `carreras` (`idPerfilProfesional`, `PPNombre`) VALUES
(1, 'Técnico de Fibra Óptica Planta Interna'),
(2, 'Técnico de Fibra Óptica Panta Externa'),
(3, 'Ingeniero de Redes'),
(4, 'Ingeniero de Tráfico de Red'),
(5, 'Ingeniero de Sistemas'),
(6, 'Especialista de conecterización de Fibra Óptica'),
(7, 'Especialista de MUFAS Ópticas'),
(8, 'Especialista de cableado Estructurado'),
(9, 'Técnico en Red Ftth');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE distrito (
  idDistrito int(11) NOT NULL primary key auto_increment,
  DNombre varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO distrito (`idDistrito`, `DNombre`) VALUES
(1, 'Callao'),
(2, 'Bellavista'),
(3, 'Carmen de La Legua'),
(4, 'La Perla'),
(5, 'La Punta'),
(6, 'Mi Perú'),
(7, 'Ventanilla'),
(8, 'Lima'),
(9, 'Ancón'),
(10, 'Ate'),
(11, 'Barranco'),
(12, 'Breña'),
(13, 'Carabayllo'),
(14, 'Cieneguilla'),
(15, 'Chaclacayo'),
(16, 'Chorrillos'),
(17, 'Comas'),
(18, 'El Agustino'),
(19, 'Independencia'),
(20, 'Jesús María'),
(21, 'La Molina'),
(22, 'La Victoria'),
(23, 'Lince'),
(24, 'Los Olivos'),
(25, 'Lurigancho'),
(26, 'Lurín'),
(27, 'Magdalena del Mar'),
(28, 'Miraflores'),
(29, 'Pachacámac'),
(30, 'Pucusana'),
(31, 'Pueblo Libre'),
(32, 'Puente Piedra'),
(33, 'Punta Hermosa'),
(34, 'Punta Negra'),
(35, 'Rímac'),
(36, 'San Bartolo'),
(37, 'San Borja'),
(38, 'San Isidro'),
(39, 'San Juan de Lurigancho'),
(40, 'San Juan de Miraflores'),
(41, 'San Luis'),
(42, 'San Martín de Porres'),
(43, 'San Miguel'),
(44, 'Santa Anita'),
(45, 'Santa María del Mar'),
(46, 'Santa Rosa'),
(47, 'Santiago de Surco'),
(48, 'Surquillo'),
(49, 'Villa El Salvador'),
(50, 'Villa María del Triunfo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE empresa (
  idEmpresa int(11) NOT NULL primary key auto_increment,
  `ErazonSocial` varchar(120) NOT NULL,
  `Eruc` varchar(11) NOT NULL,
  `Ececular` varchar(11) NOT NULL,
  `Edireccion` varchar(150) NOT NULL,
  `EfechaRegistro` date NOT NULL,
  `EcodigoPostal` varchar(10) NOT NULL,
  `estado` int(11) DEFAULT 0, -- 0: en espera | 1: activo/aceptado | 2: rechazado
  `EnombreComercial` varchar(120) NOT NULL,
  `EnumeroActividades` int(11) DEFAULT 0,
  `idDistrito` int(11) NOT NULL,
  `ecorreo` varchar(50) NOT NULL,
  `password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `empresa` (`idEmpresa`, `ErazonSocial`, `Eruc`, `Ececular`, `Edireccion`, `EfechaRegistro`, 
`EcodigoPostal`, `estado`, `EnombreComercial`, `EnumeroActividades`, `idDistrito`, `ecorreo`, `password`) 
VALUES (1, 'GOODJOB SAC PERU', '20345678912', '987987789', 'Los de tomas valle mas naki', '2019-11-10', 
'15103', 1, 'GoodJob', 0, 42, 'goodjob@gmail.com', 'goodjob');

--
--
-- Estructura de tabla para la tabla `tipopremiun`
--

CREATE TABLE `tipopremiun` (
  `idTipoPremiun` int(11) NOT NULL,
  `TPnombre` varchar(100) NOT NULL,
  `TPdescripcion` varchar(500) NOT NULL,
  `TPprecio` double NOT NULL,
  `TPcantidadPost` int(11) NOT NULL,
  `TPfechaInicio` datetime NOT NULL,
  `TPfechaExpiracion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL primary key auto_increment,
  `UFoto` blob DEFAULT NULL,
  `Unombre` varchar(50) NOT NULL,
  `UPaterno` varchar(50) NOT NULL,
  `UMaterno` varchar(50) NOT NULL,
  `Udni` varchar(8) DEFAULT NULL,
  `UPasaporte` bigint(20) DEFAULT NULL,
  `UfechaNacimiento` date DEFAULT NULL,
  `Ucelular` varchar(11) DEFAULT NULL,
  `idPerfilP` int(11) DEFAULT NULL,
  `Ucorreo` varchar(50) NOT NULL,
  `idDistrito` int(11) DEFAULT NULL,
  `Udireccion` varchar(150) DEFAULT NULL,
  `Upass` varchar(20) NOT NULL,
  `idTipoPremiun` int(11) DEFAULT NULL,
  `UfechaRegistro` date NOT NULL,
  actividades_disponibles int,
  publicaciones_disponibles int,
  puntaje int,
  reputacion_ptos decimal(8,2),
  cantidad_votos int,
  `Uestado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO usuario VALUES
(null, NULL, 'Juan Carlos', 'Castillo', 'Aycachi', '70555913', NULL, '1993-04-01', '979666355', 5, 'carlosjordi@hotmail.com', 42, 'Las Margaritas', 'admin', NULL, '2019-07-02', 2, 1, 0, 0, 0, 1);

INSERT INTO usuario VALUES
(null, NULL, 'Max Anthony', 'Cachi', 'Ayala', '63571099', NULL, '1999-01-03', '985863707', 5, 'anthonyca18m@gmail.com', 17, 'comas city #123', 'admin', NULL, '2019-06-25', 2, 1, 0, 0, 0, 1);

INSERT INTO usuario VALUES
(null, NULL, 'Gustavo Adolfo', 'Lizarzaburu', 'Mercado', null, NULL, null, '935902409', 5, 'lizarzaburu@gmail.com', 42, 'Ovalo Granda', 'admin', NULL, '2019-07-02', 2, 1, 70, 9, 2, 1);

INSERT INTO usuario VALUES
(null, NULL, 'Yaser Andre', 'Quinonez', 'Chaponan', null, NULL, null, '922721204', 5, 'yaser@gmail.com', 1, 'Lejos de casa', 'admin', NULL, '2019-07-02', 2, 1, 0, 0, 0, 1);

create table tipo_recompensa
(
	id int auto_increment primary key,
    descripcion varchar(30)
);

insert into tipo_recompensa values(null, 'Puntos');
insert into tipo_recompensa values(null, 'Dinero');

create table actividad
(
	id int(11) auto_increment primary key,
    titulo varchar(30) not null,
    descripcion varchar(140) not null,
    empresa int not null,
    fecha_creacion date not null,
    fecha_fin date not null, 
    participantes_actuales int default 0,
    participantes_requeridos int not null,
    foto varchar(255) default null,
    tipo_recompensa int not null,
    recompensa decimal(10,2) not null,
    distrito int not null,
    tipo_seleccion int not null,
    mensaje varchar(250) default null,
    estado int default 0, -- 0: en espera | 1: aceptado | 2: rechazado
    foreign key (tipo_recompensa) references tipo_recompensa(id),
    FOREIGN KEY (empresa) references empresa (idEmpresa),
    FOREIGN KEY (distrito) references distrito (idDistrito)
);

insert into actividad (titulo, descripcion, empresa, fecha_creacion, fecha_fin, participantes_requeridos, foto, tipo_recompensa, 
recompensa, distrito, tipo_seleccion, estado) values ('GoodJob Opening', 'Apertura de la plataforma GoodJob', 1, curdate(), '2019-12-17',
10, '1GoodJob Opening', 1, 3000, 1, 1, 1);

insert into actividad (titulo, descripcion, empresa, fecha_creacion, fecha_fin, participantes_requeridos, foto, tipo_recompensa, 
recompensa, distrito, tipo_seleccion, estado) values ('GoodJob Afterparty', 'Celebreishon GoodJob', 1, curdate(), '2019-12-17',
20, '1GoodJob Afterparty', 1, 5000, 1, 1, 1);

create table postulacion_actividad
(
	id int auto_increment primary key,
    id_actividad int not null,
    id_usuario int not null,
    estado int, -- 1: en espera | 2: aceptado | 3: rechazado
    foreign key(id_actividad) references actividad(id),
    foreign key(id_usuario) references usuario(idUsuario)
);

--
-- Índices para tablas volcadas
--


--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idPerfilProfesional`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD KEY `idDistrito` (`idDistrito`);

--
-- Indices de la tabla `tipopremiun`
--
ALTER TABLE `tipopremiun`
  ADD PRIMARY KEY (`idTipoPremiun`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD UNIQUE KEY `Udni` (`Udni`),
  ADD KEY `idDistrito` (`idDistrito`),
  ADD KEY `idPerfilP` (`idPerfilP`),
  ADD KEY `idTipoPremiun` (`idTipoPremiun`);

--
-- AUTO_INCREMENT de las tablas volcadas
--


--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `idPerfilProfesional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipopremiun`
--
ALTER TABLE `tipopremiun`
  MODIFY `idTipoPremiun` int(11) NOT NULL AUTO_INCREMENT;


--
-- Restricciones para tablas volcadas
--


--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`idDistrito`) REFERENCES `distrito` (`idDistrito`);


--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idDistrito`) REFERENCES `distrito` (`idDistrito`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idPerfilP`) REFERENCES `carreras` (`idPerfilProfesional`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`idTipoPremiun`) REFERENCES `tipopremiun` (`idTipoPremiun`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
