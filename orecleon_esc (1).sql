-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost:3306
-- Timp de generare: feb. 13, 2023 la 11:55 AM
-- Versiune server: 5.6.51-cll-lve
-- Versiune PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `orecleon_esc`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_1` text,
  `address_2` text,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `disbursements`
--

CREATE TABLE `disbursements` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `beneficiary_name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `additional_info` text NOT NULL,
  `intermediary` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `disbursements`
--

INSERT INTO `disbursements` (`id`, `user_id`, `country`, `currency`, `bank_name`, `beneficiary_name`, `code`, `iban`, `additional_info`, `intermediary`, `status`, `created_at`, `updated_at`) VALUES
(10, 24, 'AF', 'USD', 'bank name', 'beneficiary account name', 'swift', 'iban', '', 0, 1, '2023-02-12 13:54:15', '2023-02-12 13:54:15');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tracking`
--

CREATE TABLE `tracking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tracking` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Eliminarea datelor din tabel `tracking`
--

INSERT INTO `tracking` (`id`, `user_id`, `tracking`) VALUES
(0, 6, 'test123'),
(0, 6, 'teste123'),
(0, 6, 'test3123'),
(0, 6, 'teste123'),
(0, 6, 'testing123'),
(0, 6, 'test123'),
(0, 6, 'test123'),
(0, 6, 'tester123'),
(0, 6, 'testere1213'),
(0, 6, 'test123'),
(0, 6, 'terte2'),
(0, 6, 'test123'),
(0, 6, 'teste123');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `role` enum('Seller','Buyer','Broker') NOT NULL DEFAULT 'Buyer',
  `currency` varchar(255) NOT NULL,
  `inspection_period` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` double(15,2) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `item_description` text,
  `other_name` varchar(255) DEFAULT NULL,
  `other_email` varchar(255) DEFAULT NULL,
  `status` enum('Awaiting Agreement','Waiting Payment from Buyer','Payment Received - Deliver Goods','Goods Received','Seller Paid','Canceled') DEFAULT 'Awaiting Agreement',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `title`, `role`, `currency`, `inspection_period`, `item_name`, `item_price`, `item_category`, `item_description`, `other_name`, `other_email`, `status`, `created_at`, `updated_at`) VALUES
(25, 23, 'iphone 14 in bulk 400 phones', 'Buyer', 'GBP', 1, '400 iphone 14', 250000.00, 'electornics', '400 iphone 14', 'Marcel Ionescu', 'louisjeanGabriel006@gmail.com', 'Awaiting Agreement', '2023-02-11 19:02:35', '2023-02-11 19:02:35'),
(26, 6, '400 x Iphones', 'Seller', 'USD', 1, 'Iphone', 100000.00, 'Phones', 'Neverlocked phones', 'Test', 'cryptonkali@gmail.com', 'Awaiting Agreement', '2023-02-12 13:38:04', '2023-02-12 13:38:04'),
(27, 6, 'Test transaction', 'Seller', 'USD', 1, '400 Iphones', 100000.00, 'Phones', '400 Iphones email test', 'Lewis', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 13:43:42', '2023-02-12 13:43:42'),
(28, 6, 'test123', 'Seller', 'USD', 1, 'test', 15000.00, 'Phones', 'Iphones', 'test', 'cryptonkali@gmail.com', 'Awaiting Agreement', '2023-02-12 14:54:08', '2023-02-12 14:54:08'),
(29, 6, 'test123', 'Seller', 'USD', 1, 'test', 15000.00, 'Phones', 'Iphones', 'test', 'cryptonkali@gmail.com', 'Awaiting Agreement', '2023-02-12 15:02:00', '2023-02-12 15:02:00'),
(30, 25, 'test', 'Seller', 'USD', 1, 'test', 12312.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:14:47', '2023-02-12 21:14:47'),
(31, 25, 'test', 'Seller', 'USD', 1, 'test', 1231.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:22:06', '2023-02-12 21:22:06'),
(32, 25, 'test', 'Seller', 'USD', 1, 'test', 123121.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:22:55', '2023-02-12 21:22:55'),
(33, 42, 'test', 'Seller', 'USD', 1, 'test', 12312.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:26:40', '2023-02-12 21:26:40'),
(34, 42, 'alexander', 'Seller', 'USD', 1, 'alexandrer', 23423.00, 'erre', 'erere', 'ere', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:29:03', '2023-02-12 21:29:03'),
(35, 25, 'trtet', 'Seller', 'USD', 1, 'tetete', 112321.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:35:15', '2023-02-12 21:35:15'),
(36, 25, 'trtet', 'Seller', 'USD', 1, 'tetete', 112321.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:38:04', '2023-02-12 21:38:04'),
(37, 25, 'testst', 'Seller', 'USD', 1, 'tste', 1223131.00, 'etete', 'ttetetet', 'tete', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:38:26', '2023-02-12 21:38:26'),
(38, 25, 'teste', 'Seller', 'USD', 1, 'teste', 1231.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:57:46', '2023-02-12 21:57:46'),
(39, 25, 'teste', 'Seller', 'USD', 1, 'teste', 1231.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:58:36', '2023-02-12 21:58:36'),
(40, 25, 'test', 'Seller', 'USD', 1, 'test', 55555.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 21:59:00', '2023-02-12 21:59:00'),
(41, 25, 'adsgasd', 'Seller', 'USD', 1, 'sfgasg', 34123.00, 'gasgfa', 'sfgsfgs', 'sfgsf', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 22:04:32', '2023-02-12 22:04:32'),
(42, 25, 'test', 'Seller', 'USD', 1, 'test', 12312.00, 'test', 'test', 'test', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-12 22:09:17', '2023-02-12 22:09:17'),
(43, 42, 'gagfasasfd', 'Buyer', 'USD', 1, 'sdfasf', 123123.00, 'sdffasf', 'dfsafs', 'sdgafasd', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-13 15:18:31', '2023-02-13 15:18:31'),
(44, 42, 'trtet', 'Buyer', 'USD', 1, 'tete', 12312312.00, 'tete', 'tete', 'tete', 'kingpako777@gmail.com', 'Awaiting Agreement', '2023-02-13 16:35:05', '2023-02-13 16:35:05'),
(45, 42, 'tete', 'Seller', 'USD', 1, 'tet', 1231312.00, 'teette', 'tete', 'tete', 'kingpako777@gmail.com', 'Waiting Payment from Buyer', '2023-02-13 16:35:46', '2023-02-13 16:35:46');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `verified` tinyint(1) DEFAULT '2',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `middle_name`, `last_name`, `password`, `verified`, `email`, `phone`, `created_at`) VALUES
(6, 'sin.marius85@gmail.com', 'Test', 'test', 'test', '$2y$10$CD.2xI0mb4c6fL/Onv/Df.dGW2NSrG1zmRcvBF/N4kyg9GxPCKCpW', 2, 'test@gmail.com', '123131', '2023-02-05 13:28:02'),
(23, 'coroianmarius@mail.com', NULL, NULL, NULL, '$2y$10$rl2pgYSFgup51QT6JqZdo.5XuYI/79USViYCuqNhhfIM.vYOLuZTC', 2, NULL, NULL, '2023-02-11 13:54:55'),
(24, 'louisjeanGabriel006@gmail.com', NULL, NULL, NULL, '$2y$10$5ol.0RtBNJE8Pz1n175vK.zwET9Douodv0CMsMvfM0C1291FqW3a.', 2, NULL, NULL, '2023-02-11 14:11:30'),
(25, 'cryptonkali@gmail.com', NULL, NULL, NULL, '$2y$10$OGFCcqmam3lSuQCf/lmt5uOfvh6TxwMVlRUOqIL3HRX/WCGGbnV1e', 2, NULL, NULL, '2023-02-11 14:13:16'),
(26, 'cacaca@gmail.com', NULL, NULL, NULL, '$2y$10$mN32YRPnYecr1WSMBHQ5Cu0lxAJO/A4UEPM.Gsk7gDFfByOk/H/te', 2, NULL, NULL, '2023-02-12 07:11:01'),
(27, 'dfasf@gmail.com', NULL, NULL, NULL, '$2y$10$gJMtJdTGnkT1seB5xKtAhuZieRkNmPaDPVJDJVo91Ga8G88/7wgl2', 2, NULL, NULL, '2023-02-12 07:17:05'),
(28, 'test123@gmail.com', NULL, NULL, NULL, '$2y$10$k5.7/ASMBg6i6crr8K3RYOsp3doZM.cwNkZ9.ip7Jqhfm64d4dFkW', 2, NULL, NULL, '2023-02-12 07:35:58'),
(29, 'daf@gmail.com', NULL, NULL, NULL, '$2y$10$YdrC0LRxmWjcBUh05yJcAehxP2i3knMG.WZLCekVrwea0fTYtSGZO', 2, NULL, NULL, '2023-02-12 07:55:52'),
(30, 'wer@gmail.com', NULL, NULL, NULL, '$2y$10$FiSToie4uvLCWg6/iaPeB.PpDYUzPox4AudIeRDhTXhUffgsHYiQu', 2, NULL, NULL, '2023-02-12 09:02:13'),
(31, 'efdasfa@gmail.com', NULL, NULL, NULL, '$2y$10$dn0tw229vF2AEpvClMf/Eu1gV6ea0I6EaqpJbGmmzWEfYwBgrD3A.', 2, NULL, NULL, '2023-02-12 10:13:12'),
(32, 'tesst@gmail.com', NULL, NULL, NULL, '$2y$10$fghCMYcapu4PVfBk.yVh8ei/0mfkqI933eiXq.WQ1dSy7KAwSO4/u', 2, NULL, NULL, '2023-02-12 10:21:45'),
(33, 'daadsfda@ccc.com', NULL, NULL, NULL, '$2y$10$rLcBxMcWY/9kTjuipn23vOMMM0PHKD2UUbaDYX5YuxJ2x24eUCwn.', 2, NULL, NULL, '2023-02-12 10:27:31'),
(34, 'calala@gmail.com', NULL, NULL, NULL, '$2y$10$D5FzC20STrI6BtB3r5NQwOdr59ipvID2Jm7Gl0qUQL3an6u7jHVWK', 2, NULL, NULL, '2023-02-12 11:01:44'),
(35, 'sdfgasf@gmail.com', NULL, NULL, NULL, '$2y$10$YH/aKnI7GQrCF.aKjgu9JOZOt4NIMRAPRoIhRV07yAmVmHcd1iZcC', 2, NULL, NULL, '2023-02-12 11:10:52'),
(36, 'dafasdf@gmail.com', NULL, NULL, NULL, '$2y$10$qYL7hpXO0lcHivj5aCjjkerx7urnwphY3XTf7LDFKYAEVac58HCTW', 2, NULL, NULL, '2023-02-12 15:48:05'),
(37, 'sdfasdfs@gmail.com', NULL, NULL, NULL, '$2y$10$kBdK3hIOHhLdxhCuaUCUTuEQlSvwt1MNNyf1KFxXp0O//bdVAM6nK', 2, NULL, NULL, '2023-02-12 15:53:58'),
(38, 'dfadf@gmail.com', NULL, NULL, NULL, '$2y$10$VVY6W.RmY6OOET4LYC6N6O0Ec.6wypLYT7k50cy6.3zu19Wz9EvSK', 2, NULL, NULL, '2023-02-12 15:56:40'),
(39, 'dadads@gmail.com', NULL, NULL, NULL, '$2y$10$VW0plPsD0tW8Ja4/JLp10eUng6TqQZZMv9iA.o//SqNAjSZqLt/qm', 2, NULL, NULL, '2023-02-12 15:57:57'),
(40, 'dafa@gmail.com', NULL, NULL, NULL, '$2y$10$u8XmNZVtAQa4I4BpcG0fluWtSiAsM5p4G74SBOyZO4BEsp3TZypGe', 2, NULL, NULL, '2023-02-12 15:58:42'),
(41, 'kingpako777@gmail.com', NULL, NULL, NULL, '$2y$10$RpoEsmLd2Nez5bYr7AIkyeg3RrmfmDfVouYo8DY5fi79BUR8JoHrK', 2, NULL, NULL, '2023-02-12 16:01:20'),
(42, 'alealexandrasialex@gmail.com', NULL, NULL, NULL, '$2y$10$zVJnQYIctTMgrhg.Npr8euW9M0dqIpQl02I3Gth16oCU96lNd2oT2', 2, NULL, NULL, '2023-02-12 16:26:01');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `disbursements`
--
ALTER TABLE `disbursements`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `disbursements`
--
ALTER TABLE `disbursements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
