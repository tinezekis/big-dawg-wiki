class VersionDisplayObject

	def initialize(slug)
		@article 				 	= Article.find(Article.match_id(slug))
		@version 					= @article.current_version || Version.new
    @sections 				= @version.get_sections
    @markdown_content = @version.generate_markdown
	end

	attr_reader :article, :version, :sections, :markdown_content









end