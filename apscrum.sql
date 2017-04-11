-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Kwi 2017, 13:59
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `apscrum`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarzeproj`
--

CREATE TABLE `komentarzeproj` (
  `IDKomProj` int(11) NOT NULL,
  `TrescKomProj` varchar(1000) DEFAULT NULL,
  `idprojektu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarzezad`
--

CREATE TABLE `komentarzezad` (
  `IDKomZad` int(11) NOT NULL,
  `TrescKomZad` text,
  `idzadanie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `IDPracownik` int(11) NOT NULL,
  `idusera` int(11) DEFAULT NULL,
  `idroli` int(11) DEFAULT NULL,
  `idprojektu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `projekt`
--

CREATE TABLE `projekt` (
  `IDProjektu` int(11) NOT NULL,
  `Nazwa_projektu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rola`
--

CREATE TABLE `rola` (
  `IDRola` int(11) NOT NULL,
  `Nazwa_roli` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprint`
--

CREATE TABLE `sprint` (
  `IDSprint` int(11) NOT NULL,
  `Nazwa_sprintu` varchar(50) DEFAULT NULL,
  `Opis_sprintu` text,
  `CzasTrwaniaSprintu` int(11) DEFAULT NULL,
  `idprojekt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stan`
--

CREATE TABLE `stan` (
  `IDStan` int(11) NOT NULL,
  `Nazwa_stanu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `IDUser` int(11) NOT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `Haslo` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Imie` varchar(30) DEFAULT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zadania`
--

CREATE TABLE `zadania` (
  `IDZadania` int(11) NOT NULL,
  `Nazwa_zadania` varchar(50) DEFAULT NULL,
  `CzasTrwaniaZad` int(11) DEFAULT NULL,
  `OpisZadania` text,
  `idprojektu` int(11) DEFAULT NULL,
  `idstanu` int(11) DEFAULT NULL,
  `idsprintu` int(11) DEFAULT NULL,
  `idpracownika` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `komentarzeproj`
--
ALTER TABLE `komentarzeproj`
  ADD PRIMARY KEY (`IDKomProj`),
  ADD KEY `KPfkPRO` (`idprojektu`);

--
-- Indexes for table `komentarzezad`
--
ALTER TABLE `komentarzezad`
  ADD PRIMARY KEY (`IDKomZad`),
  ADD KEY `KZfkZAD` (`idzadanie`);

--
-- Indexes for table `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`IDPracownik`),
  ADD KEY `PRfkUS` (`idusera`),
  ADD KEY `PRfkRO` (`idroli`),
  ADD KEY `PRfkPRO` (`idprojektu`);

--
-- Indexes for table `projekt`
--
ALTER TABLE `projekt`
  ADD PRIMARY KEY (`IDProjektu`);

--
-- Indexes for table `rola`
--
ALTER TABLE `rola`
  ADD PRIMARY KEY (`IDRola`);

--
-- Indexes for table `sprint`
--
ALTER TABLE `sprint`
  ADD PRIMARY KEY (`IDSprint`),
  ADD KEY `SPRfkPRO` (`idprojekt`);

--
-- Indexes for table `stan`
--
ALTER TABLE `stan`
  ADD PRIMARY KEY (`IDStan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDUser`);

--
-- Indexes for table `zadania`
--
ALTER TABLE `zadania`
  ADD PRIMARY KEY (`IDZadania`),
  ADD KEY `ZADfkPRO` (`idprojektu`),
  ADD KEY `ZADfkST` (`idstanu`),
  ADD KEY `ZADfkSPR` (`idsprintu`),
  ADD KEY `ZADfkPRA` (`idpracownika`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `komentarzeproj`
--
ALTER TABLE `komentarzeproj`
  MODIFY `IDKomProj` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `komentarzezad`
--
ALTER TABLE `komentarzezad`
  MODIFY `IDKomZad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `IDPracownik` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `projekt`
--
ALTER TABLE `projekt`
  MODIFY `IDProjektu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `rola`
--
ALTER TABLE `rola`
  MODIFY `IDRola` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `sprint`
--
ALTER TABLE `sprint`
  MODIFY `IDSprint` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `stan`
--
ALTER TABLE `stan`
  MODIFY `IDStan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `IDUser` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `zadania`
--
ALTER TABLE `zadania`
  MODIFY `IDZadania` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `komentarzeproj`
--
ALTER TABLE `komentarzeproj`
  ADD CONSTRAINT `KPfkPRO` FOREIGN KEY (`idprojektu`) REFERENCES `projekt` (`IDProjektu`);

--
-- Ograniczenia dla tabeli `komentarzezad`
--
ALTER TABLE `komentarzezad`
  ADD CONSTRAINT `KZfkZAD` FOREIGN KEY (`idzadanie`) REFERENCES `zadania` (`IDZadania`);

--
-- Ograniczenia dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `PRfkPRO` FOREIGN KEY (`idprojektu`) REFERENCES `projekt` (`IDProjektu`),
  ADD CONSTRAINT `PRfkRO` FOREIGN KEY (`idroli`) REFERENCES `rola` (`IDRola`),
  ADD CONSTRAINT `PRfkUS` FOREIGN KEY (`idusera`) REFERENCES `user` (`IDUser`);

--
-- Ograniczenia dla tabeli `sprint`
--
ALTER TABLE `sprint`
  ADD CONSTRAINT `SPRfkPRO` FOREIGN KEY (`idprojekt`) REFERENCES `projekt` (`IDProjektu`);

--
-- Ograniczenia dla tabeli `zadania`
--
ALTER TABLE `zadania`
  ADD CONSTRAINT `ZADfkPRA` FOREIGN KEY (`idpracownika`) REFERENCES `pracownik` (`IDPracownik`),
  ADD CONSTRAINT `ZADfkPRO` FOREIGN KEY (`idprojektu`) REFERENCES `projekt` (`IDProjektu`),
  ADD CONSTRAINT `ZADfkSPR` FOREIGN KEY (`idsprintu`) REFERENCES `sprint` (`IDSprint`),
  ADD CONSTRAINT `ZADfkST` FOREIGN KEY (`idstanu`) REFERENCES `stan` (`IDStan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
