if @skills
  json.array! @skills = @skills.is_a?(Array) ? @skills : [@skills], partial: 'skills/skill', as: :skill
end