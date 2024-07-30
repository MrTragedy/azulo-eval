CREATE TABLE `AirportOperator` (
  `id` int UNSIGNED NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE `AirportOperator`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `AirportOperator`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

INSERT INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`, `preview_url`, `versioning`) VALUES
('AirportOperator', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open', NULL, 0);

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `special`, `interface`, `options`, `display`, `display_options`, `readonly`, `hidden`, `sort`, `width`, `translations`, `note`, `conditions`, `required`, `group`, `validation`, `validation_message`) VALUES
(12, 'AirportOperator', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(13, 'AirportOperator', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\": true}', 1, 1, 3, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(14, 'AirportOperator', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\": true}', 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(15, 'AirportOperator', 'Name', NULL, 'input', NULL, NULL, NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO `directus_permissions` (`id`, `role`, `collection`, `action`, `permissions`, `validation`, `presets`, `fields`) VALUES
(3, NULL, 'AirportOperator', 'read', '{}', '{}', NULL, '*'),
(6, NULL, 'AirportOperator', 'update', '{}', '{}', NULL, '*');