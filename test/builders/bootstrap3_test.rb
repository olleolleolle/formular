require 'test_helper'
require "formular/builders/bootstrap3"

describe Formular::Builders::Bootstrap3 do
  let(:model) { Comment.new(nil, "Something exciting", [Reply.new], Owner.new) }
  let(:builder) { Formular::Builders::Bootstrap3.new(model: model, path: :comment) }

  describe "returns html correctly" do
    it "#outputs with block" do
      form = builder.form(action: "/questions/13") { |f| f.input(:body).to_s }
      form.to_s.must_equal %(<form method="post" action="/questions/13"><div class="form-group"><label class="control-label" for="comment_body">Body</label><input type="text" class="form-control" name="comment[body]" id="comment_body" value="Something exciting"/></div></form>)
    end

    it "#outputs without block (use end)" do
      form = builder.form(action: "/questions/13", method: "put")
      html = form.to_s
      html << form.input(:body).to_s
      html << form.end

      html.must_equal %(<form method="put" action="/questions/13"><div class="form-group"><label class="control-label" for="comment_body">Body</label><input type="text" class="form-control" name="comment[body]" id="comment_body" value="Something exciting"/></div></form>)
    end
  end
end

describe Formular::Builders::Bootstrap3Horizontal do
  let(:model) { Comment.new(nil, "Something exciting", [Reply.new], Owner.new) }
  let(:builder) { Formular::Builders::Bootstrap3Horizontal.new(model: model, path: :comment) }

  describe "returns html correctly" do
    it "#outputs with block" do
      form = builder.form(action: "/questions/13") { |f| f.input(:body).to_s }
      form.to_s.must_equal %(<form method="post" class="form-horizontal" action="/questions/13"><div class="form-group"><label class="col-sm-2 control-label" for="comment_body">Body</label><div class="col-sm-10"><input type="text" class="form-control" name="comment[body]" id="comment_body" value="Something exciting"/></div></div></form>)
    end

    it "#outputs without block (use end)" do
      form = builder.form(action: "/questions/13", method: "put")
      html = form.to_s
      html << form.input(:body).to_s
      html << form.end

      html.must_equal %(<form method="put" class="form-horizontal" action="/questions/13"><div class="form-group"><label class="col-sm-2 control-label" for="comment_body">Body</label><div class="col-sm-10"><input type="text" class="form-control" name="comment[body]" id="comment_body" value="Something exciting"/></div></div></form>)
    end
  end
end

describe Formular::Builders::Bootstrap3Inline do
  let(:model) { Comment.new(nil, "Something exciting", [Reply.new], Owner.new) }
  let(:builder) { Formular::Builders::Bootstrap3Inline.new(model: model, path: :comment) }

  describe "returns html correctly" do
    it "#outputs with block" do
      form = builder.form(action: "/questions/13") { |f| f.input(:body).to_s }
      form.to_s.must_equal %(<form method="post" class="form-inline" action="/questions/13"><div class="form-group"><label class="control-label" for="comment_body">Body</label><input type="text" class="form-control" name="comment[body]" id="comment_body" value="Something exciting"/></div></form>)
    end

    it "#outputs without block (use end)" do
      form = builder.form(action: "/questions/13", method: "put")
      html = form.to_s
      html << form.input(:body).to_s
      html << form.end

      html.must_equal %(<form method="put" class="form-inline" action="/questions/13"><div class="form-group"><label class="control-label" for="comment_body">Body</label><input type="text" class="form-control" name="comment[body]" id="comment_body" value="Something exciting"/></div></form>)
    end
  end
end