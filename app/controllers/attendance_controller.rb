class AttendanceController < ApplicationController

    def create
        attendance = Attendance.new(attendance_params)
        unless attendance.save
             flash[:errors] = attendance.errors.full_messages
        end
         redirect_to groups_path
    end

    def destroy
        attendance = Attendance.find(params[:id])
        unless attendance.destroy
          flash[:errors] = attendance.errors.full_messages
        end
        redirect_to groups_path
    end

    private
        def attendance_params
            params.require(:attendance).permit(:user_id, :group_id)
        end
end
