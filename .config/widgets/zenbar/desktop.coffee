command: "echo $(x=$(/usr/local/bin/chunkc tiling::query -d id);echo $(/usr/local/bin/chunkc tiling::query -D $(/usr/local/bin/chunkc tiling::query -m id))\",$x\")"

refreshFrequency: 500 #ms

render: (output) ->
  values = output.split(',')
  spaces = values[0].split(' ')

  htmlString = """
    <div class="currentDesktop-container" data-count="#{spaces.length}">
      <ul>
  """

  for i in [0..spaces.length - 1]
    htmlString += "<li id=\"desktop#{i+1}\"><span>#{i+1}</span></li>"

  htmlString += """
      <ul>
    </div>
  """

style: """
  position: relative
  margin-top: 10px
  font: 10px "Menlo"
  color: #aaa
  font-weight: 100

  ul
    list-style: none
    margin: 0 0 0 10px
    padding: 0

  li
    display: inline
    margin: 0 10px

  img
    max-height: 20px
    max-width: 20px

  li.active
    color: #ededed
    border-bottom: 2px solid #ededed
"""

update: (output, domEl) ->
  values = output.split(',')
  spaces = values[0].split(' ')
  space = values[1]

  htmlString = ""
  for i in [0..spaces.length - 1]
    htmlString += "<li id=\"desktop#{i+1}\"><span>#{i+1}</span></li>"

  if ($(domEl).find('.currentDesktop-container').attr('data-count') != spaces.length.toString())
     $(domEl).find('.currentDesktop-container').attr('data-count', "#{spaces.length}")
     $(domEl).find('ul').html(htmlString)
     $(domEl).find("li#desktop#{space}").addClass('active')
  else
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find("li#desktop#{space}").addClass('active')
