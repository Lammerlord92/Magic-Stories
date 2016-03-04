class Searches::ProfileController < ApplicationController
  def search
    @q = params[:q, :choice]


    if (choice == 'friends')


      if @q
        subquery = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
        query = '(profiles.name like :q OR signature like :q OR description like :q)'
        @users = Profile.distinct(:user_id).joins(:friendships).where(subquery, { cu_id: current_user.id}) & Profile.where(query, q: "%#{@q}%")



        if @users.blank?
          flash.alert = "User Not found"
        end
      else
        query = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
        @users = Profile.distinct(:user_id).joins(:friendships).where(query, {cu_id: current_user.id})
      end

    elsif (choice == 'no_friends')


      if @q
        query = '(profiles.name like :q OR signature like :q OR description like :q)'
        subquery = '(users.id != :cu_id and friendships.friend_id = :cu_id)'

        @users = Profile.distinct(:user_id).joins(:friendships).where(query, {q: "%#{@q}%"}) &
            (Profile.all - Profile.distinct(:user_id).joins(:friendships).where(subquery, {cu_id: current_user.id}))
        if @users.blank?
          flash.alert = "User Not found"
        end
      else
        query = '(users.id != :cu_id and friendships.friend_id = :cu_id)'
        @users = Profile.all - Profile.distinct(:user_id).joins(:friendships).where(query, {cu_id: current_user.id})
      end

    else
      #Los perfiles a mostrar deben ser públicos o ser amigo del que vas a buscar
      query = '(name like :q OR signature like :q OR description like :q)'

      if @q
        @users = Profile.where(query, {q: "%#{@q}%"})
        if @users.blank?
          flash.alert = "User Not found"
        end
      else
        @users = Profile.all
      end

    end



end
