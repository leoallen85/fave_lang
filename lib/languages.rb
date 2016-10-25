class Languages

  def initialize(languages)
    @languages = languages
  end

  def empty?
    languages.empty?
  end

  def favourite
    languages
      .each_with_object(counter) { |lang, count| count[lang] += 1 }
      .group_by { |lang, count| count }
      .max_by { |count, lang| count }
      .last
      .map(&:first)
      .join("/")
  end

  private

  attr_reader :languages

  def counter
    Hash.new(0)
  end
end
