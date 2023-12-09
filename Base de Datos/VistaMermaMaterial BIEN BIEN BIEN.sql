USE `don_galleto`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `don_galleto`.`vistamermamaterial` AS
    SELECT 
    
        `mm`.`idMermaMaterial` AS `idmermamaterial`,
        `mm`.`cantidad` AS `cantidad`,
        `mm`.`unidad` AS `unidad`,
        `vm`.`idmaterial` AS `idmaterial`,
        `vm`.`ingrediente` AS `ingrediente`,
        `vm`.`cantidad` AS `materialCantidad`,
        `vm`.`detalle_cantidad` AS `detalle_cantidad`,
        `vm`.`costo_material` AS `costo_material`,
        `vm`.`idinventario` AS `idinventario`,
        `vm`.`existencia` AS `existencia`
    FROM
        (`don_galleto`.`mermamaterial` `mm`
        JOIN (SELECT 
            `m`.`idMaterial` AS `idmaterial`,
                `m`.`ingrediente` AS `ingrediente`,
                `m`.`cantidad` AS `cantidad`,
                `m`.`detalle_cantidad` AS `detalle_cantidad`,
                `m`.`costo_material` AS `costo_material`,
                `i`.`idInventario` AS `idinventario`,
                `i`.`existencia` AS `existencia`
        FROM
            (`don_galleto`.`material` `m`
        JOIN `don_galleto`.`inventario` `i`)
        WHERE
            (`m`.`idInventario` = `i`.`idInventario`)) `vm`)
    WHERE
        (`vm`.`idmaterial` = `mm`.`idMaterial`);