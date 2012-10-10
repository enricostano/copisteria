module ControllerHelper
  def should_authorize(action, subject)
    controller.should_receive(:authorize!).with(action, subject).and_return('passed!')
  end
end
