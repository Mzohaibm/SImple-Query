SELECT
    e.employee_id,
    e.employee_name,
    e.department,
    COUNT(p.project_id) AS total_projects,
    AVG(p.project_budget) AS avg_project_budget
FROM
    employees e
LEFT JOIN
    employee_projects ep ON e.employee_id = ep.employee_id
LEFT JOIN
    projects p ON ep.project_id = p.project_id
WHERE
    e.department IN ('Engineering', 'Marketing')
    AND p.project_status = 'Active'
GROUP BY
    e.employee_id, e.employee_name, e.department
HAVING
    COUNT(p.project_id) > 0
ORDER BY
    total_projects DESC, avg_project_budget DESC;
