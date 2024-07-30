CREATE TABLE `Airport` (
  `id` int UNSIGNED NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `AirportCode` varchar(255) DEFAULT NULL,
  `PriorityOrder` int DEFAULT NULL,
  `AirportOperatorId` int UNSIGNED DEFAULT NULL,
  `LocationId` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `Airport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airport_airportoperatorid_foreign` (`AirportOperatorId`),
  ADD KEY `airport_locationid_foreign` (`LocationId`);

ALTER TABLE `Airport`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

INSERT INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`, `preview_url`, `versioning`) VALUES
('Airport', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open', NULL, 0);

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `special`, `interface`, `options`, `display`, `display_options`, `readonly`, `hidden`, `sort`, `width`, `translations`, `note`, `conditions`, `required`, `group`, `validation`, `validation_message`) VALUES
(16, 'Airport', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(17, 'Airport', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\": true}', 1, 1, 7, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(18, 'Airport', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\": true}', 1, 1, 8, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(19, 'Airport', 'Name', NULL, 'input', NULL, NULL, NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(21, 'Airport', 'AirportCode', NULL, 'input', NULL, NULL, NULL, 0, 0, 4, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(25, 'Airport', 'PriorityOrder', NULL, 'input', NULL, NULL, NULL, 0, 0, 6, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(26, 'Airport', 'AirportOperatorId', 'm2o', 'select-dropdown-m2o', '{\"template\": \"{{Name}}\"}', NULL, NULL, 0, 0, 3, 'full', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(28, 'Airport', 'LocationId', 'm2o', 'select-dropdown-m2o', '{\"template\": \"{{ProviceOrState}}\"}', NULL, NULL, 0, 0, 5, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO `directus_permissions` (`id`, `role`, `collection`, `action`, `permissions`, `validation`, `presets`, `fields`) VALUES
(2, NULL, 'Airport', 'read', '{}', '{}', NULL, '*'),
(5, NULL, 'Airport', 'update', '{}', '{}', NULL, '*');

INSERT INTO `directus_relations` (`id`, `many_collection`, `many_field`, `one_collection`, `one_field`, `one_collection_field`, `one_allowed_collections`, `junction_field`, `sort_field`, `one_deselect_action`) VALUES
(3, 'Airport', 'AirportOperatorId', 'AirportOperator', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(4, 'Airport', 'LocationId', 'Location', NULL, NULL, NULL, NULL, NULL, 'nullify');