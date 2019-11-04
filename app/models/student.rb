class Student

  attr_accessor :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(boating_test_name, boating_test_status, instructor)
    BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
  end

  def self.find_student(first_name)
    Student.all.select do |student|
      student.first_name == first_name
    end
  end

  def grade_percentage
    total = BoatingTest.all.select do |bt|
      bt.student == self
    end
    x=total.map do |b|
      b.boating_test_status=="passed"
    end
    x.count(true)/x.length.to_f
  end

end
