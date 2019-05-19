class BaseParam
  include ActiveModel::Validations
  BUILT_IN_TYPES = [
    Axiom::Types::Array,
    Axiom::Types::Boolean,
    Axiom::Types::Date,
    Axiom::Types::DateTime,
    Axiom::Types::Float,
    Axiom::Types::Decimal,
    Axiom::Types::Integer,
    Axiom::Types::Object,
    Axiom::Types::String,
    Axiom::Types::Time
  ].freeze
  
end