class Instructor

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def pass_student(student, test_name)
    a = BoatingTest.all.select do |bt|
      bt.student == student && bt.boating_test_name == test_name
    end
    if a.length > 0
      a.first.boating_test_status = "passed"
    else
      a = BoatingTest.new(student, boating_test_name, "passed", self)
    end
    a
  end

  def fail_student(student, test_name)
    a = BoatingTest.all.select do |bt|
      bt.student == student && bt.boating_test_name == test_name
    end
    if a.length > 0
      a.first.boating_test_status = "failed"
    else
      a = BoatingTest.new(student, boating_test_name, "failed", self)
    end
    a
  end


end
