class ObjectsSearch
  def initialize(relation)
    @relation = relation
  end

  class << self
    def contains_param(model)
      "#{model.searchable_fields.join('_or_')}_cont".to_sym
    end
  end

  def find_contains(query)
    return false unless @relation && @relation.model.searchable_fields.present?

    query = case query
            when Hash
              query.slice self.class.contains_param(@relation.model)
            else
              { self.class.contains_param(@relation.model) => query }
            end

    @relation.search(query)
  end

  def find_related(to_object, within_relation, partial_match = false)
    return false unless @relation
    extract_fully_related(
      to_object,
      @relation.includes(within_relation).where(
        within_relation => { id: to_object.send(within_relation).ids }
      ),
      partial_match
    )
  end

  private

  def extract_fully_related(to_object, related, partial_match)
    related.partition do |obj|
      to = to_object.skills.ids
      from = obj.skills.ids

      (to & from).length == (partial_match ? from : to).length
    end
  end
end
