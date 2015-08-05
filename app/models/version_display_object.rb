class VersionDisplayObject

	def initialize(slug)
		@article 				 	= Article.find(Article.match_id(slug))



	end

	attr_reader :article, :sections, :markdown_content, :errors
	attr_accessor :version

	def edited_by_second_user?
		@version.updating_author && @article.orig_author != @version.updating_author
	end

	def doesnt_have_footnotes?
		@version.footnotes == nil || @version.footnotes == ''
	end

	def set_current_version
		@version	= @article.current_version || Version.new
		# what does this return if there is no current version?
	end

	def set_sections_and_markdown
    @sections 				= @version.get_sections
    # returns [] for empty Version
    @markdown_content = @version.generate_markdown
    # returns "" for empty Version
	end




end