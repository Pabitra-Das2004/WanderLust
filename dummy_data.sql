
TRUNCATE TABLE users, services, flights, trains, hotels, packages, bookings, payments RESTART IDENTITY CASCADE;

INSERT INTO users (name, email, password, role)
VALUES ('Admin User', 'admin@example.com', 'password', 'admin');

INSERT INTO users (name, email, password, role)
VALUES ('Theodore Gottlieb', 'Al.Yundt64@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Trisha Renner', 'Stefanie12@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Carroll Pacocha', 'Keshawn_Greenfelder@yahoo.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Celia Mitchell', 'Ethan.Aufderhar@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Lennie Glover', 'Arnaldo_Kerluke-Murazik43@gmail.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Bryan Block', 'Dorothy79@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Angelina Kunze PhD', 'Angel61@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Augustus Volkman V', 'Danika94@yahoo.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Karine Jacobi', 'Colleen9@gmail.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Jadon Bartell V', 'Federico72@gmail.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Dr. Jennie Schumm', 'Lamar_Wintheiser@gmail.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Miss Ashtyn Runolfsdottir-Fritsch', 'Emory.Padberg67@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Dianne Heller', 'Brendan.Reichert58@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Kendra VonRueden', 'Michale.Frami@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Leon Kuphal', 'Edgar_Cruickshank48@hotmail.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Mable Johnson', 'Otho_Quigley71@hotmail.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Madelyn Crist', 'Micah.Yost@hotmail.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Albina Conroy', 'Earnestine11@yahoo.com', 'password', 'customer');

INSERT INTO users (name, email, password, role)
VALUES ('Grayce Huel', 'Piper_Flatley@gmail.com', 'password', 'creator');

INSERT INTO users (name, email, password, role)
VALUES ('Austin Nikolaus', 'Brielle62@gmail.com', 'password', 'creator');



INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (1, 'Robel, Franey and Metz Hotel', 'hotel', 10, 323.642119871237, 'Voco adeptio teres adipiscor rerum astrum sit aperiam ventosus. Acceptus tardus sperno quaerat ventosus depopulo sursum approbo vox. Solio theca decimus supra vulnus ultra.', 'https://th.bing.com/th/id/OIP.9NEsEzKVEazVx0AGSQaKDQHaDw?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (1, 'New Sherry, Belize', '2026-08-24T08:59:31.021Z', '2027-02-24T07:30:47.904Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (2, 'Rohan-Stokes Inc Express', 'train', 6, 439.50430070434084, 'Amaritudo ustulo temporibus. Titulus aduro comptus auditor crepusculum adipiscor pecco explicabo curvo ciminatio. Vulariter saepe uterque animus alioqui constans sub nisi aegrotatio.', 'https://www.livemint.com/lm-img/img/2023/09/21/1600x900/ANI-20230708344-0_1692243128024_1695279868901.jpg');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (2, 'South Rhiannafield', 'Wisozkview', '2027-01-19T22:27:49.275Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (3, 'Ebert, Wolff and Rippin Hotel', 'hotel', 10, 496.47055920722323, 'Suus tergo cui cohors decor uterque summisse vapulus terga. Cerno sapiente altus peior argentum compello antea. Textilis crastinus cervus turbo odio vigilo absque currus cresco.', 'https://tse1.mm.bing.net/th/id/OIP.VZJ1oNaIy5BfesyKqjITpwHaE7?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (3, 'Port Jadeland, Tajikistan', '2026-11-30T17:47:33.594Z', '2027-04-20T11:57:45.213Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (4, 'Crona LLC Airlines', 'flight', 6, 1019.7552644852007, 'Tempora argumentum compono. Sint ara reprehenderit abscido molestias solium deinde communis rem. Suscipit administratio cruentus mollitia argumentum umquam fugiat sodalitas tenus.', 'https://th.bing.com/th/id/OIP.fkFg4XsmcJIt0yfMFnlsMgHaCm?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (4, 'Effertzcester', 'Altoona', '2027-04-08T22:40:37.737Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (5, 'Denesik - Harris Hotel', 'hotel', 6, 582.7247467110302, 'Amoveo benigne velit defaeco uxor suasoria aperiam tego viridis. Umquam solio solvo accendo una acsi. Correptius avarus vinitor.', 'https://th.bing.com/th/id/OIP.zf0UauaOrytnaLeF2XtwIQHaEr?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (5, 'Cheyennechester, Democratic People''s Republic of Korea', '2026-12-12T14:44:04.893Z', '2026-10-12T10:55:28.679Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (6, 'North Maximus Adventure Package', 'package', 9, 989.2337088506201, 'Clementia undique vindico thalassinus subito comptus veniam clam ara vigilo. Quae conor bos censura votum amaritudo quo. Eum aetas unus.', 'https://tse1.mm.bing.net/th/id/OIP.FPvKBVyDuU2Ncw9ONjA5jAHaE7?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (6, 'Flower Mound, Sao Tome and Principe', '2026-11-09T02:18:47.628Z', '2026-11-08T08:42:36.393Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (7, 'Nolan, D''Amore and Cruickshank Express', 'train', 10, 692.4494941973643, 'Acquiro calcar contigo magni synagoga. Deputo aegre deficio cohibeo vita uberrime summisse aer arx. Aequitas commodo tabgo nostrum.', 'https://tse4.mm.bing.net/th/id/OIP.4JMzFu8F9Pv5Lf2w8ue1IgHaEU?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (7, 'Lake Murlton', 'Kamrynboro', '2027-04-01T14:02:42.567Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (8, 'Pfeffer Inc Hotel', 'hotel', 21, 1327.5308336301339, 'Aetas cur beatus qui approbo aurum summa tabgo thymum eos. Xiphias comis vel molestias architecto molestiae ascisco copiose. Vulariter at curiositas.', 'https://q-xx.bstatic.com/xdata/images/hotel/max1024x768/192348468.jpg?k=da6f94f10d9832530e40af2492fbf11347f5621af60437c93a8f6b0f47305d65&o=');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (8, 'Escondido, Georgia', '2026-12-03T22:48:51.171Z', '2027-01-16T23:53:00.085Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (9, 'Kilback - Schroeder Airlines', 'flight', 18, 263.43248352396756, 'Suadeo amplitudo argentum. Comparo substantia amita teneo demonstro veniam civis nemo vapulus. Molestiae universe terreo voluntarius dicta nam taceo caelum velit.', 'https://static1.thetravelimages.com/wordpress/wp-content/uploads/2023/03/singapore-airlines.jpg');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (9, 'South Kristineburgh', 'North Irvin', '2026-11-13T21:56:44.035Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (10, 'Mayer, Bergnaum and Sauer Express', 'train', 21, 1226.2800367117509, 'Vicinus adduco auctus ad victoria cetera paulatim blandior victus. Desino suscipio callide stillicidium acsi sustineo ipsam clementia. Id substantia conatus carbo thesis vicinus.', 'https://cdn.images.express.co.uk/img/dynamic/78/940x705/5228667.jpg');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (10, 'Lake Alena', 'Waterbury', '2027-03-13T14:24:06.055Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (11, 'Paucek - Kemmer Hotel', 'hotel', 20, 586.1096100018816, 'Adeptio socius adimpleo combibo demo tam comminor est peccatus ascit. Decet suscipit thesis. Aeger aegrotatio cogo nulla ultio despecto abstergo cogo.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/319424563.jpg?k=8f48a4273cc78ec23235ce7191d2c9224f9d11c91545cf9a87cbe6113a4186ab&o=&hp=1');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (11, 'Cathedral City, Lebanon', '2026-09-26T10:29:54.059Z', '2026-11-25T17:56:03.631Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (12, 'Williamson Inc Express', 'train', 18, 258.85097387550445, 'Demoror brevis ciminatio capitulus atrocitas terga attero stipes arceo. Corona curso fugit vulnero ab creator commodi vitiosus. Adfero advenio suscipit cariosus turbo statua strues.', 'https://c8.alamy.com/comp/2JTMFPX/norfolk-southern-train-9944-passes-railroad-cars-filled-with-coal-at-the-williamson-railyard-april-28-2010-in-williamson-west-virginia-2JTMFPX.jpg');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (12, 'Denesikboro', 'Daxfield', '2026-08-24T02:40:03.202Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (13, 'Grand Prairie Adventure Package', 'package', 16, 332.56489822405445, 'Unde adiuvo totus. Toties vergo ventus facilis vir cursim vere textus deserunt atavus. Capillus placeat stips acer cupressus paens nihil tribuo triduana viriliter.', 'https://th.bing.com/th/id/OIP.kqc8SbOUeCqgOs4sGbou0gHaE7?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (13, 'Lake Lavon, Syrian Arab Republic', '2026-10-15T18:37:27.273Z', '2026-12-01T19:32:50.556Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (14, 'Ortizfurt Adventure Package', 'package', 16, 1703.5091955009495, 'Arceo comis aequitas validus unus depromo aliquam supplanto sum. Aeger candidus nihil exercitationem in non iure cupiditate umquam. Appono cado sol atqui administratio ars triumphus uter.', 'https://www.exploretourism.in/upload/theme/adventure-banner.jpg');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (14, 'Murfreesboro, Grenada', '2027-01-20T03:58:32.507Z', '2026-07-20T10:37:09.001Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (15, 'Kochhaven Adventure Package', 'package', 16, 1110.6836476046826, 'Contigo currus curvo aetas arcesso totus voluptate alius apto mollitia. Terga amoveo cohibeo theca cogito theologus. Accusantium soluta aer bestia compono audax curtus spectaculum.', 'https://extremeadventurecancun.com/_astro/adventure-package.BQOpJG3L.webp');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (15, 'Montebello, Pakistan', '2026-05-19T16:53:12.953Z', '2026-05-23T09:36:21.828Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (16, 'Bogan, Weimann-Little and Murazik Express', 'train', 10, 783.0697077144204, 'Tremo asperiores patior degenero clementia comedo summopere adicio. Contabesco aureus alienus atrox bos consectetur thema tui beatus vorago. Allatus vinum tamdiu cauda.', 'https://th.bing.com/th/id/OIP.tjtFa1uiMfBrJkFfr25NngHaEK?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (16, 'South Rochelleborough', 'Andersonstad', '2027-04-17T04:45:08.309Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (17, 'McDermott, Bayer and Waelchi Airlines', 'flight', 4, 759.190821925117, 'Claro officia nostrum vitiosus numquam sortitus sopor repudiandae deporto fugit. Denego conor apto comes deserunt supra venio admiratio adsuesco. Colo decumbo admoveo repellat vomito apparatus spes coniecto cultura ex.', 'https://www.reuters.com/resizer/v2/BTXSABKH5RMTFEC3J4BEZSJDZI.jpg?auth=5d7ff503e627e3343849adecbb2507b03cf714b2d444fe2c1af20ab9324d2b05&height=1005&width=1920&quality=80&smart=true');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (17, 'Lake Huldafurt', 'Trevormouth', '2026-09-24T17:18:16.787Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (18, 'Price Inc Airlines', 'flight', 11, 1347.499436182717, 'Arbor cunabula tabernus. Comminor vehemens tristis ab volup. Verto facere accendo demulceo verto paulatim.', 'https://tse4.mm.bing.net/th/id/OIP.77VkCtWOUcVzA6p27o9plgHaEL?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (18, 'Port Devan', 'Port Queen', '2027-04-29T00:15:27.226Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (19, 'Lockman and Sons Express', 'train', 4, 1203.4845133290044, 'Animadverto cubicularis cultellus minima sit cultura. Aurum accendo terreo cibo ter creator comitatus. Solvo adflicto conscendo utroque vehemens angelus concedo tergiversatio approbo sponte.', 'https://th.bing.com/th/id/OIP.4r93DMA6XzqcrLr8vRsvlQHaFj?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (19, 'North Kylieborough', 'Rathville', '2026-10-17T21:54:42.895Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (20, 'Lind - Bradtke Hotel', 'hotel', 11, 503.34495824127396, 'Officia defleo canonicus corona addo. Adhuc aetas curo cernuus averto demitto cerno vergo. Sursum ater terga adsum confido cruciamentum.', 'https://th.bing.com/th/id/OIP.uZgDRYUEYrpzAIFi-ZgBQgHaEP?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (20, 'Westfield, Argentina', '2027-03-31T13:34:20.752Z', '2026-10-23T13:56:58.730Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (21, 'Stehr - Runolfsson Hotel', 'hotel', 10, 352.5905581887912, 'Arbustum tremo testimonium adduco patruus totus auxilium crapula. Vero cubo careo tendo beatae coaegresco cresco depulso clementia. Valeo certe vitiosus ultio vesica.', 'https://images.ctfassets.net/nwbqij9m1jag/2FXXWToThBKZZ834zeFhhW/04d0d1089d77b1a12cf9aa921f03fc9d/twinroom-bed-view-north-picture-quality-hotel-richard-with_16_9?fm=webp&q=80&w=565');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (21, 'South Howard, Armenia', '2026-10-25T16:14:36.090Z', '2026-12-12T15:25:31.761Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (22, 'Rau, Hilpert and Anderson Express', 'train', 16, 618.7712948248289, 'Advoco validus aegrotatio paulatim aro amet conatus. Clamo defetiscor talus viduo triduana. Volaticus torrens unus consectetur.', 'https://tse1.mm.bing.net/th/id/OIP.EjR6XID3PH55CpMB1qNSnAHaFj?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (22, 'North Norma', 'Detroit', '2027-01-05T00:26:16.807Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (23, 'Casper Inc Express', 'train', 11, 1777.3325098042658, 'Voluptate succurro calculus uxor adeo. Thesaurus stultus sublime adipisci doloremque. Autem crastinus arbustum.', 'https://th.bing.com/th/id/OIP.zpyRWh3BLgAO_ASgncQ57gHaFE?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (23, 'Cormierboro', 'North Jeremyton', '2026-07-28T03:03:25.636Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (24, 'Dicki Inc Express', 'train', 18, 686.6605954680625, 'Tabula cultura compono adicio virtus aiunt aperio pauci. Torqueo tyrannus laudantium summisse pax carbo charisma acies charisma nobis. Terror angelus crastinus impedit spargo soluta id venustas.', 'https://resize.indiatvnews.com/en/resize/gallery/1200_-/2025/02/navyug-express-6-1739279673.jpg');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (24, 'Fort Felicitatown', 'Dickensstead', '2027-04-29T12:27:29.621Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (25, 'Hackettborough Adventure Package', 'package', 21, 85.61284609503662, 'Tremo vindico appello degenero ciminatio abundans. Confido amplitudo auxilium creber depulso. Contego vulgivagus termes cauda paens apostolus defero.', 'https://images.squarespace-cdn.com/content/v1/6513e08888707561f21712aa/261caeb3-6fba-482d-8803-03cc1b307417/IMG_2821.jpeg');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (25, 'Madiebury, Saint Lucia', '2026-10-20T22:55:47.804Z', '2026-09-13T19:38:54.940Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (26, 'Minot Adventure Package', 'package', 20, 308.43046542954147, 'Laboriosam deleo adulatio suggero suus tum. Atavus cultellus adstringo temeritas ad antiquus demitto vel calco cimentarius. Ventosus defungo cicuta dapifer adsum impedit celebrer.', 'https://tse2.mm.bing.net/th/id/OIP.jRWgCrKlYrq3Je6NTgHMBgHaEL?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (26, 'Dickensworth, Saint Helena', '2026-11-23T23:34:20.006Z', '2027-01-07T06:57:13.224Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (27, 'Russel and Sons Hotel', 'hotel', 18, 896.7422926602703, 'Cursus desparatus arbustum cetera triduana vomito. Bonus substantia voluptates brevis accusator cetera volva colo vilitas. Capillus absque cogo arx vacuus varius.', 'https://tse2.mm.bing.net/th/id/OIP.XzmocGey4q0XSuAQddbbMgHaE6?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (27, 'East Oraboro, South Georgia and the South Sandwich Islands', '2026-12-14T18:51:52.277Z', '2026-10-19T04:31:15.218Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (28, 'Wisozk, Swift and Brown Hotel', 'hotel', 10, 834.5163835442255, 'Pecus ver neque deficio amo similique talis tamen triumphus vir. Textilis comedo vehemens vomito advenio demoror ipsum. Dapifer vox ante strenuus decerno stultus attollo.', 'https://th.bing.com/th/id/OIP.w4-jcatw5gnhlaozoJJ6_wHaEK?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (28, 'South Tamichester, Japan', '2026-05-12T18:56:30.161Z', '2026-09-14T19:13:36.769Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (29, 'Turcottebury Adventure Package', 'package', 18, 1445.336293762663, 'Sit adsidue arguo adstringo talus dicta. Avaritia depraedor deludo. Damnatio ocer libero.', 'https://th.bing.com/th/id/OIP.rv21O034yKmHK0SeQeGBGwHaCg?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (29, 'Fort Remingtonboro, Ghana', '2026-05-29T20:36:00.617Z', '2026-06-02T01:24:35.940Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (30, 'Rolfson Group Hotel', 'hotel', 12, 216.93300315417451, 'Aestas id sursum considero reiciendis voluptatem deduco sint astrum. Somnus caute utpote cibo urbs adulatio auctus. Volva conduco minima possimus ipsa atqui.', 'https://executiveafricantraveller.com/wp-content/uploads/2024/06/Radisson-Hotel-Group.webp');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (30, 'Metairie, Hong Kong', '2026-12-07T14:42:12.230Z', '2026-08-18T17:13:37.389Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (31, 'Mraz, Sanford and Koss Hotel', 'hotel', 16, 1436.8007749929018, 'Contigo verbera avarus somniculosus. Averto voco velut amoveo absorbeo aequitas summa absum. Tantum summopere usitas sol usus canis tamisium cultura alter.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/666133626.jpg?k=67edd8be9a8606f0e978c5136f48a0814564846b35c66742c56aab6c720a0d80&o=');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (31, 'New Angelica, Malaysia', '2027-02-03T05:26:39.757Z', '2026-10-07T07:12:59.034Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (32, 'Klocko, Mueller and Douglas Hotel', 'hotel', 18, 1753.7157486977546, 'Amplexus aufero laboriosam via. Viscus unde abeo voluptatibus aliqua. Uxor cauda consequuntur spiculum videlicet fugiat cernuus.', 'https://tse1.mm.bing.net/th/id/OIP.WusW27lqbNV0LKken7PK1gHaFj?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (32, 'Lake Paoloside, Cook Islands', '2026-09-14T07:24:56.197Z', '2027-03-03T11:00:15.254Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (33, 'Cremin, Gerlach and Collins Airlines', 'flight', 9, 1171.924863919905, 'Substantia teneo officiis bardus spargo subvenio conforto textus. Coadunatio vetus defendo. Rerum ut texo uterque.', 'https://tse3.mm.bing.net/th/id/OIP.Csm6udBeA9gi0e79rJCAjAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (33, 'Lake Lelandfield', 'Elijahview', '2026-11-03T21:28:20.689Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (34, 'Rodriguez - Blick Express', 'train', 11, 1638.1134725756897, 'Vita deprimo aedificium curto vehemens coerceo decor accendo. Depulso quos vir tenetur amicitia. Acquiro facere consequatur adeo debeo vomer delinquo defessus usitas.', 'https://tse3.mm.bing.net/th/id/OIP.qbR9V3D004n_Mb2wCXd_ZAHaEK?rs=1&pid=ImgDetMain&o=7&rm=30');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (34, 'Stuartport', 'Bayamon', '2026-06-23T01:22:45.382Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (35, 'Skiles, Upton and Borer Airlines', 'flight', 16, 1235.1544328613109, 'Cenaculum thema deserunt blanditiis via consequatur recusandae tum cetera sursum. Repellat contigo bellum. Adsum vitae damnatio cimentarius adnuo magnam thalassinus audentia conqueror.', 'https://th.bing.com/th/id/OIP.eJ3t7CVdnBfXtqiMxGfOtwHaDt?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=31');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (35, 'Fort Sidneychester', 'Lake Cali', '2026-10-11T02:26:16.286Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (36, 'Lynch - Gutkowski Airlines', 'flight', 20, 1847.6065881260681, 'Contabesco vestigium vestigium. Charisma tepesco aranea quidem. Dolores comedo minus quam somnus.', 'https://i.pinimg.com/736x/71/e1/4c/71e14c4110bfdd0fd1a45483a68e379d.jpg');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (36, 'South David', 'Garden Grove', '2026-05-01T03:45:38.864Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (37, 'Pollich, Miller and Ebert-Ankunding Express', 'train', 4, 1407.6967418659706, 'Uterque temperantia ustilo tego adeo patrocinor cras. Admiratio tumultus atqui celo baiulus comedo. Vulnus delinquo casso tutis error spes studio soluta aestus statua.', 'https://sapanomad.com/wp-content/uploads/damitrans-express-train-1.webp');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (37, 'Lake Valeriehaven', 'Lake Ridge', '2026-07-23T20:44:30.045Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (38, 'Kunzechester Adventure Package', 'package', 4, 1617.0710304649551, 'Canis degusto attero vociferor bibo avaritia spiculum debeo caritas veritatis. Caveo texo infit crur deleniti tremo animi. Civitas rerum considero.', 'https://tse2.mm.bing.net/th/id/OIP.yZmT4hriU-9BOEulfnH2XAHaEc?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (38, 'Port Velma, Cyprus', '2027-04-14T09:17:04.934Z', '2026-06-09T15:54:34.220Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (39, 'Daniel - White Airlines', 'flight', 11, 254.79835340191974, 'Degero cui vado tametsi esse vulnero aetas sperno conduco. Deduco annus clam. Talis cognatus curatio atqui.', 'https://th.bing.com/th/id/OIP.SHCMU9zW_3qG7p-m-O0a6AHaDt?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (39, 'Deionfield', 'Veum-Wizaborough', '2026-11-02T18:13:11.869Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (40, 'Mablefort Adventure Package', 'package', 11, 82.98864225771418, 'Virgo conspergo aperio corpus nemo coruscus peior creta cuppedia. Adiuvo animi despecto corporis dicta alter ullus. Nobis cornu autem adsum capio tabgo ait baiulus.', 'https://www.crystalmountainresort.com/-/media/crystal/images/2425-images/activities/adventure-pack-hero.jpg?rev=831ed3bd073b49808720822edcf51c17?h=1080&w=1920&hash=FF7859D931C4894CB3E7A0AF0D4B0546');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (40, 'Port Fosterchester, Japan', '2027-02-22T07:28:11.842Z', '2027-04-09T10:49:16.590Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (41, 'O''Reilly, Marks and Pfannerstill Hotel', 'hotel', 21, 570.4111371254728, 'Aqua calcar convoco cibus valens vilitas cras vicissitudo. Virtus illum stella cunae. Est aurum ipsum deserunt crur comes hic tripudio.', 'https://www.eclectickim.com/wp-content/uploads/2023/01/IMG_5164.jpeg');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (41, 'Jefferson City, Mayotte', '2027-03-16T20:17:33.976Z', '2026-05-14T19:02:12.101Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (42, 'Harberborough Adventure Package', 'package', 20, 634.6693463492492, 'Vesica adstringo caelestis vos esse curia ventosus cedo. Temperantia angulus atrocitas doloribus cernuus magnam veritatis. Coepi conventus celebrer totam.', 'https://res.cloudinary.com/bidr/image/upload/c_crop,g_auto,h_630,w_1200,d_item_placeholder_e0lign.jpg/16972/wbctrcczwqcgr9e4ms0z');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (42, 'Ervinfurt, Trinidad and Tobago', '2026-12-15T13:42:00.142Z', '2026-06-27T20:44:04.288Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (43, 'Fritsch, Witting and McCullough Hotel', 'hotel', 6, 223.8666456044898, 'Supplanto decipio tamen alias pauper speculum vilis. Trepide coruscus spero aperiam amicitia cognatus aestus delectatio. Amoveo vigilo succurro pecco trado decumbo una.', 'https://tse2.mm.bing.net/th/id/OIP.LlasJ4tolmUgQ_uHrDoZPgHaE8?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (43, 'Lanceport, Poland', '2026-09-12T06:35:51.319Z', '2026-10-15T01:28:34.156Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (44, 'Fritsch - DuBuque Express', 'train', 20, 1193.011629466628, 'Administratio laboriosam tertius sublime aetas coniecto utpote. Congregatio usque vos capio vehemens pariatur. Pauci tego vorax dolorum amoveo labore tracto.', 'https://th.bing.com/th/id/OIP.GtJI_Ow-AZ_mVnqtUAHNMAHaEK?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (44, 'Lawton', 'Fort Codybury', '2026-10-16T00:01:19.441Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (45, 'Schroeder - Kuhlman Express', 'train', 18, 1798.322950553673, 'Deripio antiquus sollicito veniam ullus soleo pauper aveho valens labore. Damnatio uxor auxilium delego pectus. Nam terreo colligo adamo.', 'https://static.euronews.com/articles/stories/07/24/62/42/808x608_cmsv2_b2f43294-5487-5a2d-b0c4-5e53c0d9c20e-7246242.jpg1');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (45, 'Marquardtland', 'West Allison', '2026-09-16T08:25:09.707Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (46, 'Mertz LLC Express', 'train', 4, 1201.4542790432415, 'Clementia cunctatio curso socius uter. Auditor textor adsum usus vulgo adeptio voluptatum. Sumptus sum audio consequuntur convoco conservo testimonium trepide.', 'https://th.bing.com/th/id/OIP.0adyqLiCmbjEllWXkqi8PQHaE8?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO trains (service_id, from_place, to_place, travel_date)
VALUES (46, 'East Adrian', 'Jeanetteberg', '2027-02-23T19:18:37.592Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (47, 'West Bridieport Adventure Package', 'package', 9, 1695.1567023112887, 'Vos aurum ceno arguo perferendis laboriosam. Usque somnus auctus minus mollitia articulus vacuus vomito deficio tego. Tamquam vobis pauci eaque stipes vilicus laudantium.', 'https://www.westportadventure.ie/wp-content/uploads/2023/12/aerial-trekking-10-750x500.jpg');

INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (47, 'Port Lamontberg, Paraguay', '2026-06-20T08:04:07.989Z', '2026-09-19T04:27:22.711Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (48, 'Legros LLC Airlines', 'flight', 10, 1298.8240052592346, 'Amissio voveo admitto. Ciminatio nesciunt adsum conturbo sublime pecto adinventitias concedo. Corrupti annus attonbitus compono.', 'https://tse1.mm.bing.net/th/id/OIP.V30PfqbnfWjN4N3Uq0nc_wHaFj?rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO flights (service_id, from_place, to_place, travel_date)
VALUES (48, 'North Dante', 'South Caroleborough', '2026-08-21T11:20:21.701Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (49, 'Wilderman, Lakin and Ziemann Hotel', 'hotel', 12, 1213.1321825275045, 'Qui speciosus cruciamentum barba cimentarius. Tibi adinventitias culpa animi vir tricesimus crebro bene. Cupiditas cursus benevolentia cras aer animi repudiandae.', 'https://th.bing.com/th/id/OIP.bVlKgaP2Sh-FliehDDuG6gHaDE?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3');

INSERT INTO hotels (service_id, location, start_date, end_date)
VALUES (49, 'Great Falls, Haiti', '2026-05-10T10:44:41.723Z', '2027-04-07T16:30:05.496Z');

INSERT INTO services (id, title, type, creator_id, price, description, image)
VALUES (50, 'Lake Don Adventure Package', 'package', 9, 587.1760248998366, 'Copia adduco conicio taceo aegrus sint vito inventore deduco adfero. Desino tandem conservo culpo fugiat dolores timor optio cursim. Conspergo circumvenio benigne valde peior.', 'https://tse3.mm.bing.net/th/id/OIP.rbggSiX4PCyAKjmeumyL9wHaFj?rs=1&pid=ImgDetMain&o=7&rm=3');



INSERT INTO packages (service_id, location, start_date, end_date)
VALUES (50, 'Pamelashire, Zimbabwe', '2026-09-17T05:32:10.535Z', '2026-05-18T23:44:16.513Z');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (1, 5, 31, '2026-03-18T23:22:33.350Z', 4, 5747.203099971607, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (2, 8, 49, '2025-08-20T01:06:06.445Z', 5, 6065.660912637522, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (2, 'pay_Rry4k2A7cnLnum', 6065.660912637522, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (3, 14, 41, '2025-08-14T22:59:07.838Z', 5, 2852.0556856273643, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (3, 'pay_gR94VyfMW5uiU8', 2852.0556856273643, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (4, 3, 3, '2026-01-07T07:18:43.366Z', 3, 1489.4116776216697, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (5, 7, 15, '2026-01-06T01:27:37.475Z', 1, 1110.6836476046826, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (6, 14, 37, '2026-01-24T23:24:55.312Z', 5, 7038.483709329853, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (6, 'pay_xDEHlxBiWB0lyI', 7038.483709329853, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (7, 17, 5, '2026-02-15T03:33:17.965Z', 4, 2330.898986844121, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (7, 'pay_Zz3JXReQ3IVslY', 2330.898986844121, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (8, 3, 27, '2025-09-01T02:45:34.238Z', 5, 4483.711463301352, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (9, 14, 28, '2025-06-21T22:48:01.823Z', 1, 834.5163835442255, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (10, 8, 23, '2025-08-16T20:30:05.987Z', 2, 3554.6650196085316, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (11, 19, 42, '2025-09-27T12:23:35.264Z', 3, 1904.0080390477474, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (12, 3, 45, '2026-04-12T00:40:17.319Z', 2, 3596.645901107346, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (12, 'pay_DL5HzWCjEVYKiG', 3596.645901107346, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (13, 7, 20, '2026-03-05T06:56:45.616Z', 5, 2516.72479120637, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (14, 13, 15, '2025-08-22T09:22:15.767Z', 1, 1110.6836476046826, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (15, 3, 16, '2026-02-09T15:38:55.754Z', 3, 2349.209123143261, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (16, 17, 1, '2025-06-27T20:13:15.266Z', 1, 323.642119871237, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (16, 'pay_FYysa5LX3N1Zsn', 323.642119871237, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (17, 8, 42, '2025-10-05T13:32:43.470Z', 3, 1904.0080390477474, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (18, 3, 41, '2025-12-28T06:33:00.368Z', 4, 2281.644548501891, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (19, 2, 4, '2025-09-09T12:00:31.227Z', 5, 5098.776322426003, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (20, 17, 17, '2026-03-28T01:29:41.424Z', 4, 3036.763287700468, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (21, 3, 14, '2025-07-21T15:00:20.165Z', 3, 5110.527586502849, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (22, 2, 24, '2025-08-12T18:34:53.812Z', 2, 1373.321190936125, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (23, 8, 26, '2025-10-19T21:33:41.347Z', 5, 1542.1523271477074, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (24, 15, 27, '2025-05-09T04:58:33.193Z', 4, 3586.9691706410813, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (25, 3, 16, '2026-04-09T03:54:26.876Z', 5, 3915.348538572102, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (25, 'pay_coEFyend0dKs0W', 3915.348538572102, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (26, 5, 5, '2026-02-16T20:15:08.217Z', 1, 582.7247467110302, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (27, 14, 20, '2025-07-22T15:02:15.886Z', 5, 2516.72479120637, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (28, 19, 17, '2025-08-18T04:58:42.964Z', 3, 2277.572465775351, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (29, 14, 48, '2025-11-08T07:00:20.158Z', 4, 5195.296021036938, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (30, 14, 12, '2026-04-24T05:24:28.904Z', 5, 1294.2548693775223, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (31, 2, 20, '2025-10-02T02:22:27.683Z', 2, 1006.6899164825479, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (31, 'pay_NOr6ehwslJMYCZ', 1006.6899164825479, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (32, 8, 48, '2026-04-10T21:58:19.701Z', 4, 5195.296021036938, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (33, 19, 7, '2025-10-25T21:32:26.651Z', 4, 2769.797976789457, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (33, 'pay_7g6Y2ixFncVQCr', 2769.797976789457, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (34, 17, 29, '2026-02-06T14:58:18.632Z', 3, 4336.008881287989, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (35, 5, 32, '2025-08-02T23:20:48.786Z', 4, 7014.8629947910185, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (36, 3, 3, '2025-10-07T06:59:37.037Z', 2, 992.9411184144465, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (36, 'pay_cByd9X5f49QJ7e', 992.9411184144465, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (37, 2, 15, '2025-09-15T07:19:57.352Z', 1, 1110.6836476046826, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (38, 8, 24, '2026-01-11T22:30:19.037Z', 5, 3433.3029773403127, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (38, 'pay_e6FnDSaC4vSC1A', 3433.3029773403127, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (39, 19, 25, '2025-09-12T09:55:30.090Z', 3, 256.83853828510985, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (40, 2, 48, '2025-05-25T15:04:59.439Z', 5, 6494.120026296173, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (40, 'pay_jEc3xuZnrSPtoO', 6494.120026296173, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (41, 3, 36, '2025-08-19T20:05:36.749Z', 2, 3695.2131762521362, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (42, 15, 42, '2025-07-16T07:02:04.537Z', 1, 634.6693463492492, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (42, 'pay_OqYn91hJKE3OWp', 634.6693463492492, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (43, 2, 43, '2025-09-22T12:40:37.898Z', 4, 895.4665824179592, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (44, 2, 28, '2026-01-30T17:20:00.234Z', 2, 1669.032767088451, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (45, 17, 26, '2025-07-26T00:21:42.872Z', 1, 308.43046542954147, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (46, 15, 44, '2025-07-07T19:01:38.576Z', 4, 4772.046517866512, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (47, 13, 50, '2026-04-23T19:44:26.808Z', 2, 1174.3520497996733, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (48, 14, 22, '2025-12-04T20:16:40.582Z', 1, 618.7712948248289, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (48, 'pay_m5s6qvNjhYRu9T', 618.7712948248289, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (49, 2, 44, '2025-10-25T02:31:54.290Z', 4, 4772.046517866512, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (49, 'pay_Sfb1AsnjoZNzyq', 4772.046517866512, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (50, 14, 38, '2025-08-03T04:24:28.475Z', 4, 6468.2841218598205, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (50, 'pay_XKOOm9GzPHYZ6K', 6468.2841218598205, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (51, 2, 50, '2025-06-08T08:48:15.592Z', 5, 2935.8801244991832, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (52, 13, 38, '2026-03-31T19:03:21.449Z', 2, 3234.1420609299103, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (52, 'pay_UF8KXic6FZOhAh', 3234.1420609299103, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (53, 8, 6, '2025-12-09T17:21:30.242Z', 2, 1978.4674177012403, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (54, 19, 18, '2026-03-09T07:57:18.014Z', 4, 5389.997744730868, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (54, 'pay_v0Z1UsGtgpqz9T', 5389.997744730868, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (55, 15, 21, '2026-04-06T02:27:11.637Z', 3, 1057.7716745663736, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (56, 19, 44, '2025-11-08T11:16:29.553Z', 1, 1193.011629466628, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (56, 'pay_bWYREl9xuagXlr', 1193.011629466628, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (57, 8, 21, '2025-11-02T03:03:39.343Z', 4, 1410.3622327551648, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (58, 17, 29, '2025-10-21T02:05:49.361Z', 4, 5781.345175050652, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (59, 7, 7, '2026-01-02T07:01:13.913Z', 2, 1384.8989883947286, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (60, 14, 34, '2025-09-29T15:32:16.962Z', 3, 4914.3404177270695, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (61, 14, 42, '2025-07-05T15:13:11.994Z', 1, 634.6693463492492, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (61, 'pay_2NeVkGbnQfUe0e', 634.6693463492492, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (62, 13, 28, '2025-08-30T18:17:11.759Z', 1, 834.5163835442255, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (62, 'pay_vV2puH5pFjqtwf', 834.5163835442255, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (63, 2, 37, '2025-10-26T01:47:28.368Z', 1, 1407.6967418659706, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (64, 8, 17, '2025-09-02T10:13:03.265Z', 4, 3036.763287700468, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (65, 19, 3, '2026-01-03T18:38:37.093Z', 5, 2482.352796036116, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (66, 2, 26, '2025-07-08T23:17:23.177Z', 3, 925.2913962886244, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (66, 'pay_JwobNzkWpmxpS2', 925.2913962886244, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (67, 14, 43, '2025-11-02T22:19:35.155Z', 4, 895.4665824179592, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (67, 'pay_J5OnI83Qdpi4Pm', 895.4665824179592, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (68, 8, 48, '2025-06-13T01:51:33.485Z', 2, 2597.648010518469, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (69, 5, 23, '2025-07-27T20:02:57.258Z', 2, 3554.6650196085316, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (69, 'pay_vb5ZyLnhwRJD8t', 3554.6650196085316, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (70, 13, 35, '2026-02-01T13:39:52.310Z', 5, 6175.772164306554, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (70, 'pay_dV9JxicHdFGfZE', 6175.772164306554, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (71, 3, 33, '2026-04-29T22:30:37.352Z', 5, 5859.624319599525, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (72, 3, 26, '2025-07-05T04:18:11.826Z', 4, 1233.7218617181659, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (73, 5, 44, '2025-10-22T05:05:17.461Z', 4, 4772.046517866512, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (74, 2, 20, '2025-06-22T23:50:34.627Z', 4, 2013.3798329650958, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (74, 'pay_X2OyYsqoWGoNLv', 2013.3798329650958, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (75, 13, 27, '2025-11-25T11:40:43.968Z', 1, 896.7422926602703, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (76, 7, 42, '2025-07-01T16:09:09.630Z', 2, 1269.3386926984983, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (77, 13, 33, '2025-08-19T08:27:13.435Z', 4, 4687.69945567962, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (77, 'pay_DlDwswMXPQfMeE', 4687.69945567962, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (78, 8, 11, '2025-08-23T18:49:34.188Z', 1, 586.1096100018816, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (79, 8, 33, '2026-01-19T01:02:34.056Z', 1, 1171.924863919905, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (79, 'pay_tnKsqsze18FfUH', 1171.924863919905, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (80, 8, 12, '2025-06-17T17:39:02.725Z', 2, 517.7019477510089, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (80, 'pay_rZtbuUgIrJEgcb', 517.7019477510089, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (81, 19, 29, '2025-06-05T22:36:52.181Z', 4, 5781.345175050652, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (82, 3, 28, '2025-05-29T10:56:18.616Z', 4, 3338.065534176902, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (83, 3, 17, '2025-09-19T07:23:42.362Z', 5, 3795.9541096255853, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (84, 17, 46, '2025-11-21T06:55:37.603Z', 4, 4805.817116172966, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (85, 13, 16, '2026-01-02T14:16:31.062Z', 3, 2349.209123143261, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (86, 8, 17, '2025-11-16T14:33:14.317Z', 2, 1518.381643850234, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (87, 13, 30, '2025-11-18T17:36:34.258Z', 2, 433.86600630834903, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (88, 3, 42, '2025-05-27T10:21:19.939Z', 2, 1269.3386926984983, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (89, 15, 38, '2026-04-18T12:30:09.486Z', 4, 6468.2841218598205, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (90, 14, 23, '2025-08-26T00:21:36.493Z', 2, 3554.6650196085316, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (90, 'pay_9OguXgeVuKzc99', 3554.6650196085316, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (91, 14, 3, '2026-04-03T02:06:46.285Z', 5, 2482.352796036116, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (92, 17, 27, '2026-03-07T10:59:25.248Z', 2, 1793.4845853205406, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (93, 5, 44, '2025-12-28T23:24:55.142Z', 1, 1193.011629466628, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (94, 8, 19, '2026-01-01T09:20:15.560Z', 3, 3610.453539987013, 'PENDING');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (95, 7, 41, '2025-06-12T06:33:46.616Z', 1, 570.4111371254728, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (95, 'pay_OCvmyXtOEq0vTg', 570.4111371254728, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (96, 17, 12, '2026-04-12T10:27:14.755Z', 1, 258.85097387550445, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (96, 'pay_Rd0oT4m3dnK06h', 258.85097387550445, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (97, 2, 20, '2025-12-19T11:46:57.076Z', 3, 1510.0348747238218, 'CONFIRMED');

INSERT INTO payments (booking_id, payment_id, amount, status)
VALUES (97, 'pay_mj4dVoXjKJQQai', 1510.0348747238218, 'SUCCESS');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (98, 2, 43, '2025-05-21T01:08:27.371Z', 2, 447.7332912089796, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (99, 8, 43, '2025-06-18T05:17:32.132Z', 4, 895.4665824179592, 'CANCELLED');

INSERT INTO bookings (id, user_id, service_id, booking_date, travelers, total_price, status)
VALUES (100, 15, 31, '2026-01-03T06:36:40.436Z', 3, 4310.402324978705, 'CANCELLED');




SELECT setval(
  'bookings_id_seq',
  COALESCE((SELECT MAX(id) FROM bookings), 1)
);
