class DateValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:start] << "La data di inizio deve essere antecedente alla data di fine" unless record.stop > record.start
  end
end
