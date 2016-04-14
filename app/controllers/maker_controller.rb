class MakerController < ApplicationController
  def show
    id = params[:id]
    story=Story.find(id)
#    chapters=story.chapters
#    options=Option.where("child_id in ?1 or parent_id in ?1", chapters.map(&:id))
    @aux_maker=AuxMaker.initialize
    @aux_maker.storyId=id
 #   @aux_maker.nodes=chapters.map do |c| encode_node(c)
  #  end
  #  @aux_maker.edges=options.map do |e| encode_edge(e)
  #  end
    render 'welcome/maker'
  end
  def save
    :nodes.each { |json|
      chapter=Chapter.new
      chapterAux=decode(json)
      chapter.id=chapterAux.id
      chapter.title=chapterAux.title
      chapter.body=chapterAux.body
      chapter.storyId=:storyId
      chapter.save
    }
    :edges.each { |json|
      opcion=Option.new
      opcionAux=decode(json)
      opcion.id=opcionAux.id
      opcion.title=opcionAux.title
      opcion.body=opcionAux.body
      opcion.parent =opcionAux.from
      opcion.child=opcionAux.to
      opcion.save
    }
    render 'stories/read/:storyId'
  end


    private_methods

  def decode (json)
    data = ::JSON.parse(json, quirks_mode: true)

    if ActiveSupport.parse_json_times
      convert_dates_from(data)
    else
      data
    end
  end

end