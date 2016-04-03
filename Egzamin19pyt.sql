CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `egzaminatorzy`
--

DROP TABLE IF EXISTS `egzaminatorzy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egzaminatorzy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(45) NOT NULL,
  `Nazwisko` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egzaminatorzy`
--

LOCK TABLES `egzaminatorzy` WRITE;
/*!40000 ALTER TABLE `egzaminatorzy` DISABLE KEYS */;
INSERT INTO `egzaminatorzy` VALUES (1,'Adam','Kowalski'),(2,'Zenon','Nowak'),(3,'Maciej','Zielinski'),(4,'Andrzej','Malec'),(5,'Katarzyna','Sowa'),(6,'Adrian','Morski');
/*!40000 ALTER TABLE `egzaminatorzy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmioty`
--

DROP TABLE IF EXISTS `przedmioty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmioty` (
  `Nazwa_Przedmiotu` varchar(70) NOT NULL,
  `Prog_zdawalnosci` int(2) NOT NULL,
  `ID_przedmiotu` int(11) NOT NULL AUTO_INCREMENT,
  `Egzaminatorzy_ID` int(11) NOT NULL,
  `Rok_Studiow_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_przedmiotu`,`Rok_Studiow_ID`),
  UNIQUE KEY `Nazwa_Przedmiotu_UNIQUE` (`Nazwa_Przedmiotu`),
  KEY `fk_Przedmioty_Egzaminatorzy1_idx` (`Egzaminatorzy_ID`),
  KEY `fk_przedmioty_Rok_Studiow1_idx` (`Rok_Studiow_ID`),
  CONSTRAINT `fk_Przedmioty_Egzaminatorzy1` FOREIGN KEY (`Egzaminatorzy_ID`) REFERENCES `egzaminatorzy` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_przedmioty_Rok_Studiow1` FOREIGN KEY (`Rok_Studiow_ID`) REFERENCES `rok_studiow` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmioty`
--

LOCK TABLES `przedmioty` WRITE;
/*!40000 ALTER TABLE `przedmioty` DISABLE KEYS */;
INSERT INTO `przedmioty` VALUES ('Wiedza Ogólna',8,1,1,1),('Astronomia',7,2,2,2),('Kosmetologia',6,3,3,3),('Programowanie',8,4,4,1),('Hardware',7,5,5,1);
/*!40000 ALTER TABLE `przedmioty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pytania`
--

DROP TABLE IF EXISTS `pytania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pytania` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tresc_Pytania` text NOT NULL,
  `Odpowiedz_A` varchar(255) NOT NULL,
  `Odpowiedz_B` varchar(255) NOT NULL,
  `Odpowiedz_C` varchar(255) NOT NULL,
  `Odpowiedz_D` varchar(255) NOT NULL,
  `Przedmioty_ID_przedmiotu` int(11) NOT NULL,
  `Poprawna_Odpowiedz` varchar(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_Pytania_Przedmioty1_idx` (`Przedmioty_ID_przedmiotu`),
  CONSTRAINT `fk_Pytania_Przedmioty1` FOREIGN KEY (`Przedmioty_ID_przedmiotu`) REFERENCES `przedmioty` (`ID_przedmiotu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pytania`
--

LOCK TABLES `pytania` WRITE;
/*!40000 ALTER TABLE `pytania` DISABLE KEYS */;
INSERT INTO `pytania` VALUES (1,'Który z języków programowania jest jedynym i słusznym ?','C#','Polski','Migowy','Nie ma takiego języka!',4,'a'),(2,'Który z poniższych języków programowania jest językiem kompilowanym ?','Python','TCL','C#','Ruby',4,'c'),(3,'Który z poniższych języków programowania nawiązuje do znanej grupy brytyjskich komików Latającego Cyrku...?','Java','Cobol','Fortran','Python',4,'d'),(4,'W którym z poniższych języków programowania oprogramowujemy mikrokontrolery ?','JavaScript','C','TCL','PHP',4,'b'),(5,'Kto według ostatnich statystyk zarabia na rynku IT najwięcej ?','Tester Oprogramowania','BackEnd Developer','FrontEnd Developer','Koleś w Helpdesku na słuchawie!',4,'b'),(6,'Które z poniższych oznacza przestrzeń nazw w języku C++ ?','Class','Namespace','Integer','Float',4,'b'),(7,'Ile według Ciebie powinien zarabiać początkujący Programista ?','Najniższą krajową','500zł na umowę zlecenie','Podobnie do stóża na emeryturze','Ile zawoła, powinni mu dać!!!',4,'d'),(8,'Jakie narzędzie używane jest głównie przez programistów C# ?','Notatnik','Eclipse','Visual Studio','Młotek i Kowadło',4,'c'),(9,'W zapytaniu SQL\'owym komenda: \"SELECT * FROM Jezus\" oznacza:','Pokaż wszystko z tabeli Jezus','Zaznacz wszystko dla Jezusa','Oznacz gwiazdką Jezusa','Razem z gwiazdką przyjdzie Jezus',4,'a'),(10,'Czego powinieneś się uczyć jeśli chciałbyś zostać dobrym programistą ? ','Tylko HTMLa','Obsługi kasy w LIDLu ','C, C++, C#, Pythona, SQLa, PHP i wiele innych !  ','Nie uczę się - już jestem najlepszy!',4,'c'),(11,'Jak nazywamy inaczej procesor karty graficznej ?','CPU','GPU','CHU','FTP',5,'b'),(12,'Który z wymienionych poniżej nośników pamięci jest najszybszy ? ','SRAM','DRAM','HDD','SSD',5,'a'),(13,'Co charakteryzuje procesory INTELa z serii \"K\" ','Polepszona zintegrowana Grafika','Odblokowanie mnożnika','Zwiekszona ilość pamieci Cache','Są ładniejsze z wyglądu',5,'b'),(14,'W jakiej architekturze wykonane są procesory INTELa 4 generacji ?','32nm','22nm','22mm','W architekturze krajobrazu!',5,'b'),(15,'Co spowodowało, że Core i7-5820K INTELa ma tylko 28 linii PCIe i nie wykorzystasz dwóch szybkich kart graficznych w PCIe16x/16x ?','Bariera technologiczna 5-tej generacji','INTEL \"wyżydził\" i dał tylko tyle','28 to i tak dużo','Kogo stać na dwie szybkie karty !?',5,'b'),(16,'Na jakim napięciu w przybliżeniu działają nowoczesne procesory ?','1,2v','3v','12v','2kV',5,'a'),(17,'Na ile wat ciepła w przybliżeniu musimy mieć policzony układ chłodzenia w przypadku procesora Intel Core i5-4690K ?','250W','500W','88W','15W',5,'c'),(18,'Jaką maksymalną częstotliwość taktowania kiedykolwiek, osiągnięto na procesorze INTELa (i7-4770K Haswell) ?','12 GHZ','7193 000 KHz','5100 MHZ','101 GHZ',5,'b'),(19,'Czego nie używa się do chłodzenia komponentów w IT ?','Ciekły Hel','Ciekły Azot','Woda','Radiatory z włókna węglowego',5,'d');
/*!40000 ALTER TABLE `pytania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rok_studiow`
--

DROP TABLE IF EXISTS `rok_studiow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rok_studiow` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rok_Studiow` int(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Rok_Studiow_UNIQUE` (`Rok_Studiow`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rok_studiow`
--

LOCK TABLES `rok_studiow` WRITE;
/*!40000 ALTER TABLE `rok_studiow` DISABLE KEYS */;
INSERT INTO `rok_studiow` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `rok_studiow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studenci`
--

DROP TABLE IF EXISTS `studenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studenci` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(45) NOT NULL,
  `Nazwisko` varchar(70) NOT NULL,
  `Rok_Studiow_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`Rok_Studiow_ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_studenci_Rok_Studiow1_idx` (`Rok_Studiow_ID`),
  CONSTRAINT `fk_studenci_Rok_Studiow1` FOREIGN KEY (`Rok_Studiow_ID`) REFERENCES `rok_studiow` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenci`
--

LOCK TABLES `studenci` WRITE;
/*!40000 ALTER TABLE `studenci` DISABLE KEYS */;
INSERT INTO `studenci` VALUES (1,'Dariusz','Kubicki',1),(2,'Kasia','Czerwińska',1),(3,'Aneta','Cichocka',3),(4,'Marta','Kempińska',2),(5,'Patrycja','Wilk',1),(6,'Marian','Kowalski',2),(7,'Adrian','Brodziński',3),(8,'Edyta','Palak',3),(9,'Kamil','Kozłowski',2);
/*!40000 ALTER TABLE `studenci` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-03 19:07:18
