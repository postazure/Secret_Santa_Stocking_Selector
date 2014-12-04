class MailListController < ApplicationController
  def draw
    friends = Friend.where(group_id: params[:group_id].to_i)
    givers = friends.map {|item| item}
    recievers = friends.shuffle

    selection_list = []
    givers.each do |giver|
      recievers.each do |reciever|
        if giver.name != reciever.name && giver.spouse != reciever.name
          selection_list.push([giver, reciever])
          recievers.delete(reciever)
          break
        end
      end
    end

    if selection_list.length < givers.length
      draw
    else
      @mailing_list = selection_list
    end

    # @mailing_list = [params[:group_id].to_i]
  end
end
