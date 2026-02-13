-- Trigger para inserção de reserva
CREATE TRIGGER reservas_after_insert
AFTER INSERT ON reservas
FOR EACH ROW
INSERT INTO historico (reserva_id, usuario_id_alteracao, tipo_alteracao)
VALUES (NEW.id, NEW.usuario_id, 'CRIACAO');

-- Trigger para atualização de reserva
CREATE TRIGGER reservas_after_update
AFTER UPDATE ON reservas
FOR EACH ROW
INSERT INTO historico (reserva_id, usuario_id_alteracao, tipo_alteracao)
VALUES (NEW.id, NEW.usuario_id, 'ATUALIZACAO');

-- Trigger para exclusão de reserva
CREATE TRIGGER reservas_after_delete
AFTER DELETE ON reservas
FOR EACH ROW
INSERT INTO historico (reserva_id, usuario_id_alteracao, tipo_alteracao)
VALUES (OLD.id, OLD.usuario_id, 'CANCELAMENTO');