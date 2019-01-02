
class Friend
  def greeting (*names)
    "Hello#{ names.length == 0 ? '' : ', ' + names.join(', ') }!"
  end
end
