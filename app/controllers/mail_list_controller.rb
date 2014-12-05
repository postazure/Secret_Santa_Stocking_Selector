class MailListController < ApplicationController
  def draw
    friends = Friend.where(group_id: params[:group_id].to_i)

    givers = friends.map {|item| item}
    recievers = friends.shuffle

    selection_list = []

    if friends.count >= 4

      givers.each do |giver|
        recievers.each do |reciever|
          if giver.name != reciever.name && giver.spouse != reciever.name
            selection_list.push([giver, reciever])
            recievers.delete(reciever)
            break
          end
        end
      end

    else
      givers.each do |giver|
        recievers.each do |reciever|
          if giver.name != reciever.name
            selection_list.push([giver, reciever])
            recievers.delete(reciever)
            break
          end
        end
      end

    end

    if selection_list.length < givers.length
      draw
    else
      # @mailing_list = selection_list
      return selection_list
    end
  end


  def mail_draws
    mailing_list = draw
    @current_user = current_user
    mailing_list.each do |pair|
      giver = pair.first
      reciever = pair.last

      SendDraws.send_draws_email(giver, reciever).deliver

    end
  end
end
