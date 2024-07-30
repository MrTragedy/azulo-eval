CREATE TABLE `Location` (
  `id` int UNSIGNED NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Longitude` varchar(255) DEFAULT NULL,
  `Latitude` varchar(255) DEFAULT NULL,
  `ProviceOrState` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `Location`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Location`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

INSERT INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`, `preview_url`, `versioning`) VALUES
('Location', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open', NULL, 0);

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `special`, `interface`, `options`, `display`, `display_options`, `readonly`, `hidden`, `sort`, `width`, `translations`, `note`, `conditions`, `required`, `group`, `validation`, `validation_message`) VALUES
(5, 'Location', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(6, 'Location', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\": true}', 1, 1, 7, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(7, 'Location', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\": true}', 1, 1, 6, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(8, 'Location', 'Country', NULL, 'input', NULL, NULL, NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(10, 'Location', 'Longitude', NULL, 'input', NULL, NULL, NULL, 0, 0, 4, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(11, 'Location', 'Latitude', NULL, 'input', NULL, NULL, NULL, 0, 0, 5, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(27, 'Location', 'ProviceOrState', NULL, 'input', NULL, NULL, NULL, 0, 0, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO `directus_permissions` (`id`, `role`, `collection`, `action`, `permissions`, `validation`, `presets`, `fields`) VALUES
(4, NULL, 'Location', 'read', '{}', '{}', NULL, '*'),
(7, NULL, 'Location', 'update', '{}', '{}', NULL, '*');