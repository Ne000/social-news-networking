class TopicPolicy < ApplicationPolicy
    
    def index?
        true
    end
    
    def create?
        user.present? && user.admin?
    end
    
    def update?
        create?
    end
    
    def add_comment?
        user.present?
    end
    
    def show?
        record.public? || user.present?
    end
end