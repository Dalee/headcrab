concern :BaseObject do
  included do
    scope(:latest, -> { reorder(created_at: :desc) })

    class_attribute :searchable_fields
  end
end
