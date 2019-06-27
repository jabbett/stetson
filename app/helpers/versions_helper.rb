module VersionsHelper
  def humanize_changeset(changeset)
    changeset.keys.map { |k| k.humanize }.join(', ')
  end
end