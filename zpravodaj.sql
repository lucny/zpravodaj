-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 29. dub 2015, 23:59
-- Verze serveru: 5.6.16
-- Verze PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `zpravodaj`
--
CREATE DATABASE IF NOT EXISTS `zpravodaj` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `zpravodaj`;

-- --------------------------------------------------------

--
-- Struktura tabulky `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `content` text COLLATE utf8_czech_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comments_ibfk_1` (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `content` text COLLATE utf8_czech_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL,
  `category` enum('sport','politika','zábava') COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=22 ;

--
-- Vypisuji data pro tabulku `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `created_at`, `user_id`, `category`) VALUES
(16, 'Zima se blíží, separatisté v Donbasu začali těžit uhlí', 'Východní Ukrajinou už přes půl roku zmítají boje mezi armádou a proruskými separatisty.\n\nTrpí tím nejen miliony Ukrajinců, ale i těžký průmysl, který je v Donbasu situován.\n\nNedostatkovým zbožím se s nadcházející zimou stalo především uhlí. Povstalci proto po několika měsících obnovili těžbu v dolu číslo 22 Kommunar ve vesnici Nižní Krynka, ležící východně od milionového Doněcku.\n\nTen byl donedávna pod kontrolou ukrajinských bezpečnostních sil a dobrovolnického praporu Aidar.', '2015-04-29 21:46:06', 11, 'politika'),
(17, 'Tuhá zima se blíží', 'Ve čtvrtek 21. října při běžném výkonu služby si policisté Odboru specializovaných činností Frýdek-Místek v katastru obce Chlebovice v areálu bývalé vojenské střelnice všimli zaparkovaného osobního vozidla s přívěsným vozíkem. Vozík byl do dvou třetin zaplněn čerstvě pořezaným dřevem, vedle byly připravena k naložení další dva kusy dřeva a opodál stál muž. Policisté přijeli k autu v době, kdy z lesíka přicházeli další dva muži, z nichž jeden nesl motorovou pilu. Na dotaz, co zde pohledávají, odpověděli, že zde sbírají suché popadané stromy a větve a že mají ústní povolení stavbyvedoucího. Jeden z mužů předal číslo na mobil stavbyvedoucího policistům k ověření informace. Výsledkem telefonátu bylo sdělení, že dotyční muži si ze stavby silničního obchvatu mohli odebrat suché dřevo a zbytky po těžbě, ale na jaře. V současné době pohyb po staveništi za účelem odklizení dřeva nebyl nikomu povolen. Jelikož vzniklo podezření, že zde dochází k nepovolené těžbě dřeva, byli přivoláni policisté Obvodního oddělení PČR Pálkovice, kteří si celou záležitost na místě převzali k dalšímu šetření.', '2015-04-29 21:48:04', 11, 'politika'),
(18, 'Zima se blíží!', 'Jestli jste milovníci zimních radovánek, tak si zajisté po loňském zklamání přejete, aby letos napadaly celé závěje sněhu, a vy jste mohli zase vytáhnout ze sklepů lyže a oddávat se potěšení z jízdy a kochat se výhledy do zasněžené krajiny. V hromady sněhu doufají pochopitelně i výrobci lyží, jak nám potvrdil generální ředitel výrobního podniku lyží Sporten Ján Hudák v září na tiskové konferenci v Novém Městě na Moravě. Po představení novinek pro rok 2014–15 nám otevřeli dveře i do výrobních hal podniku a seznámili nás s technologiemi výroby lyží.\n\nHistorie výroby lyží ve firmě Sporten v Novém Městě na Moravě sahá až do roku 1896, kdy se zde vyráběly lyže v malých řemeslných dílnách, a každý pár byl nezaměnitelným originálem. Za více než sto let se toho hodně změnilo, nejen v použitých materiálech, ale zejména v technologii výroby. Stále se vyrábějí lyže dřevěné, ale také lyže polyuretanové. Rozdíl mezi nimi je zcela zásadně v ceně a výrobní technologii.', '2015-04-29 21:49:42', 11, 'sport'),
(19, 'Zima se blíží...', 'O kočkách je známo, že nemají rády zimu. Jak jim tedy chladné podzimní a zimní měsíce alespoň trochu zpříjemnit?\n\n \n\nPro volně žijící kočky je zima nejtěžším obdobím v roce. Nízké teploty, sníh, mráz, studený vítr, menší a složitější možnosti při hledání potravy - to vše představuje hrozbu pro jejich přežití.\n\n \n\nV chladnějším období mají kočky zvýšenou potřebu spánku a vyhledávají teplejší místečka. Venkovním kočkám proto zpřístupníme ke spaní garáž, kůlnu, sklep nebo půdu. Připravíme sem jednu či více krabic vystlaných starým oblečením nebo senem a kočka si sama vybere místo, které jí bude vyhovovat. Pokud nemáme podobné prostory, můžeme vyrobit kočičí zateplenou boudičku, umístit ji na místo chráněné před větrem a zajistit do ní větší množství sena či slámy.\n\n \n\nV zimě je nutné kočkám dávat i více potravy, příp. výživnější stravu – jednak proto, že kvůli zahřátí spotřebují více energie, jednak kvůli tomu, že v zimě nemohou lovit myši. Pravidelně kontrolujeme i misku s vodou, zda nezamrzla. Kočky jsou pak nuceny jíst sníh, z čehož mívají zdravotní problémy. A Vy pak možná také - z částky zaplacené u veterináře.\n\n \n\nDivoce žijící kočky se o sebe obvykle dokážou postarat samy. Jsou od přírody aktivní lovci a když mohou, hledají příležitosti k lovu. Kočky patří mezi masožravce, a proto potřebují k životu vyváženou stravu, bohatou na živočišné bílkoviny. Z tohoto důvodu loví hlodavce a ptáky. Nicméně s nadcházejícím podzimem hledají i tato zvířata úkryt, ve kterém přečkají zimu. Kočky je pak nemohou lovit a musí hledat potravu jinde. Když nemají jinou možnost, hledají, kde se dá. Můžeme se pak s nimi setkat třeba i u popelnic, kde se prohrabávají odpadky a hledají něco k snědku.\n\n \n\nPři hledání jídla a teplého přístřeší přicházejí kočky také do našich domovů, kde jsou často nevítanými hosty. Snaží se dostat do sklepních prostor nebo garáží a bohužel se někdy stává, že zavřené v nich zahynou. Zimu přečkávají kočky ve skupinách, kdy takovou skupinu může tvořit i několik desítek jedinců. Když je jim zima, lehají si blízko sebe a navzájem se zahřívají. Když teplota klesne pod 10 stupňů zavinou se do klubíčka a ocasem si přikrývají nos. Nos a horní část tlamičky jsou totiž velice citlivé na změnu teploty. Jakmile v zimě na chvíli vysvitne sluníčko, lezou na zídky a střechy budov, aby se alespoň trošku ohřály ve svitu slunečních paprsků. V zimě je také můžeme vidět na parkovištích, jak leží na kapotě zrovna zaparkovaného auta v místech, kde je motor, který ještě nevychladl.\n\n \n\nKočky jsou tedy v zimě ohroženy nejen nedostatečným zdrojem potravy, ale i možností prochladnutí a umrznutí. Už teplota okolo mínus 5-10 stupňů Celsia může být pro ně životu nebezpečná. Ve větší zimě už bez naší pomoci nemusí přežít...', '2015-04-29 21:50:42', 11, 'zábava'),
(20, 'Lannister vždy splácí své dluhy', 'Potom, co Tyrion s Bronnem opustili Orlí Hnízdo, vyprávěl Tyrion Bronnovi celý příběh ohledně Tyshy. Bronn mu tenkrát řekl, že by Tywina na místě zabil za to, co mu udělal. Tyrion prohlásil, že ten čas možná někdy přijde, protože Lannister vždy splácí své dluhy.\n\nKdyž Jaime vysvobodil Tyriona ze žaláře, ještě předtím, než ho opustil, se mu přiznal k tomu, že jeho dávná historka ohledně Tyshy nebyla pravdivá, a že Tysha ve skutečnosti byla opravdu jen prostá dívka utíkající před barbary. Tyrion se velmi rozzlobil a šel přímo do komnaty svého otce Tywina. Požadoval po něm, aby mu řekl co se potom s Tyshou stalo, když bylo po všem. Tywin mu na to odpověděl, že šla tam, kam chodí všechny děvky. Tyrion poté Tywina zastřelil kuší a uprchl.', '2015-04-29 21:52:50', 11, 'politika'),
(21, 'Koláče bývají nejedlé', 'Král Joffrey si přál darovat na své svatbě hlavy Sansina bratra a matky na podnose, to přání se mu ovšem nesplnilo, když poprvé okusil svatební koláč, jeden ze sedmdesáti sedmi chodů, navzdory tomu že město hladovělo, se Joffrey začal dusit a zemřel své matce v náručí.\nZa jeho smrt byl obviněn Tyrion, ale spíš byla na vině Sansina síťka na vlasy, z které se uvolnil jeden krystalek jedu.', '2015-04-29 21:57:48', 11, 'zábava');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `password` char(128) COLLATE utf8_czech_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `role` enum('administrator','redaktor','registrovaný') COLLATE utf8_czech_ci NOT NULL DEFAULT 'registrovaný',
  `email` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `role` (`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=12 ;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `email`) VALUES
(8, 'hurvinek', '$2y$10$GkPE98xPcdeNK9JM0RnivOMjyNoqzxZNa.FJBiI85ip/NFm9h.G5m', 'Hurvínek', '', 'hurvinek@komedie.cz'),
(9, 'spejbl', '$2y$10$LC8qu6bw1Wa8Gyt87UfB.uBJqmkODpiM0jgpR16TMl0dO.cBjqwEW', 'Spejbl', '', 'spejbl@komedie.cz'),
(10, 'manicka', '$2y$10$uNgCKpqbZp8jAlfPKt4u8..Wl3fGJlVkQuyuoJzzt2L8l8xVNT9py', 'Mánička', 'redaktor', 'manicka@komedie.cz'),
(11, 'admin', '$2y$10$LiBARAo8BDnA5DboIqDNHesjx2SVm5N.8t/qqDjYC9U/.9/FjVH.2', 'Administrator', 'administrator', 'admin@skola.cz');

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
