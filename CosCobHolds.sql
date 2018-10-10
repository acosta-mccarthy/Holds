SELECT
bib.record_num AS "Record Number",
bib.title AS "Title",
bibmeta.best_author AS "Author",
COUNT (*)

FROM
sierra_view.bib_view AS bib
JOIN sierra_view.bib_record_property AS bibmeta ON bibmeta.bib_record_id = bib.id
JOIN sierra_view.hold AS hold ON bibmeta.bib_record_id = hold.record_id

WHERE

hold.pickup_location_code = 'gc' AND
bibmeta.material_code = 'a'

GROUP BY
bib.title,
bibmeta.best_author,
bibmeta.material_code,
bib.record_num having COUNT (*)>2

ORDER BY
count (*) DESC;