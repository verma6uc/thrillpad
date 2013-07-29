module ApplicationHelper

  def flash_class(level)
    case level
      when :notice then
        "alert alert-info"
      when :success then
        "alert alert-success"
      when :error then
        "alert alert-error"
      when :alert then
        "alert alert-error"
    end
  end

  def gallery_view(location)
    '<ul class="thumbnails">
              <li class="span5">
                <a class="thumbnail"  data-rel="lightbox[gallery]" href="'+location.image1.url+'" >
                  <img alt="'+ location.title+'" src="'+location.image1.url+'" style="width: 150px; height:113px"/>
                </a>
              </li>
              <li class="span5">
                <a class="thumbnail"  data-rel="lightbox[gallery]" href="'+location.image2.url+'" >
                  <img alt="'+location.title+'" src="'+location.image2.url+'"  style="width: 150px; height:113px"/>
                </a>
              </li>
              <li class="span5" style="margin-left:-2px">
                <a class="thumbnail"  data-rel="lightbox[gallery]" href="'+location.image3.url+'" >
                  <img alt="'+location.title+'" src="'+location.image3.url+'"  style="width: 150px; height:113px"/>
                </a>
              </li>
              <li class="span5">
                <a class="thumbnail"  data-rel="lightbox[gallery]" href="'+location.image4.url+'" >
                  <img alt="'+location.title+'" src="'+location.image4.url+'"  style="width: 150px; height:113px"/>
                </a>
              </li>
            </ul>'
  end

  def mini_block(location)
    '<div class="row"  style="margin-bottom: 40px"><div class="span2"><div>'+
        '<a href="'+location.uurl+'" class="roll-link roll-red">
<img alt="'+location.title+'" src="'+location.image1.thumb.url+'" />'+
        '</a></div></div><div class="span10"><div class="comment-author">
     <a href="'+location.uurl+'" class="roll-link roll-red">
      <span data-title="'+location.title+'">'+location.title+'</span></a></div><div class="comment-content">'+
        location.description.truncate(500) +
        '<a href="'+location.uurl+'" class="roll-link pull-right"><span data-title="'+location.title+'">'+
        location.title+'</span></a></div></div></div>'
  end

  def main_block(location)
    '<div class="span4" style="margin: 5px">
          <div class="white-card recent-post clearfix">
            <h5 class="recent-post-header">
              <a href="'+location.uurl+'" title="'+location.title+'">'+location.title+'</a>
            </h5>
            <div class="post-info clearfix">
              <div class="pull-left" style="font-size: 15px">
                <span class="post-date">
                  <a title="'+location.title+'" href="'+location.parent.uurl+'"> located in '+location.parent.title+'
                  </a>
                </span>
              </div>
            </div>
            <a title="'+location.title+'" href="'+location.parent.uurl+'">
              <img alt="'+location.uurl+'" class="post-image" src="'+location.image1.thumb.url+'" style="width: 392px;height:294px">
            </a>
            <p class="post-content separated">'+location.description.truncate(200)+'</p>
            <a title="'+location.title+'" href="'+location.uurl+'" class="btn btn-primary btn-extra">Read More &gt;</a>
          </div>
        </div>'
  end

  def main_hotel_block(tag_list_main)


    str1 = '<div id="filters_container" class="span7">
          <ul id="filters">
            <li style="list-style: none; float: left; width: 50px"><a href="#" data-filter="*" class="active label">All</a></li>'


    str2 = '<li style="clear: both; list-style: none">
          </li></ul>
          <ul id="sort-direction" class="option-set clearfix" data-option-key="sortAscending" style="float: right">
            <li style="list-style: none;">
              <a href="#sortAscending=true" data-filter11="true" class="label">sort ascending</a>
            </li>
            <li style="list-style: none;">
              <a href="#sortAscending=false" data-filter11="false" class="label">sort descending</a>
            </li>
          </ul>
        </div> ';

    tag_list_main.keys.sort.each do |key|
      if !(key == "")
        str1 = str1 + ' <li  style="list-style: none; float: left; width: 100px">
                  <a href="#" data-filter=".'+key+'" class="label">'+key+'</a></li> '
      end
    end
    str1 +str2;
  end


  def main_activity_block(tag_list_main)


    str1 = '<div id="filters_container" class="span7">
          <ul id="filters">
            <li style="list-style: none; float: left; width: 50px"><a href="#" data-filter="*" class="active label">All</a></li>'


    str2 = '<li style="clear: both; list-style: none">
          </li></ul>
          <ul id="sort-direction" class="option-set clearfix" data-option-key="sortAscending" style="float: right">
            <li style="list-style: none;">
              <a href="#sortAscending=true" data-filter11="true" class="label">sort ascending</a>
            </li>
            <li style="list-style: none;">
              <a href="#sortAscending=false" data-filter11="false" class="label">sort descending</a>
            </li>
          </ul>
        </div> ';

    tag_list_main.keys.sort.each do |key|
      if !(key == "")
        str1 = str1 + ' <li  style="list-style: none; float: left; width: 100px">
                  <a href="#" data-filter=".'+key+'" class="label">'+key+'</a></li> '
      end
    end
    str1 +str2;
  end

end

  
