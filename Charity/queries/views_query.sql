--// Create views
--// Overall reciepients information with payment status

CREATE VIEW recipient_view AS
SELECT recipient.id, recipient.name,type.name AS type
FROM recipient
JOIN type ON recipient.type_id = type.id;

--// Overall donor information with payment status (key file for analysing everything)

CREATE VIEW donor_view AS
SELECT d.id, d.name, d.country, d.phone, h.name AS holiday_name, ps.status AS paid_status_status, ps.amount as Amount, r.type AS role_type
FROM donor d
JOIN holiday h ON d.holiday_id = h.id
JOIN payment_status ps ON d.paid_status = ps.id
JOIN role r ON d.role_id = r.id;