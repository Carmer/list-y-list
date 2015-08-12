class AddAttachmentAttachmnetToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :attachmnet
    end
  end

  def self.down
    remove_attachment :tasks, :attachmnet
  end
end
