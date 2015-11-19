module Setup
  def script(filename)
    puts "[setup] #{filename}"
    plsql.execute File.read(filename)
  rescue OCIError
    if $!.code == 955
      puts "   skipping #{filename} - already exists"
    else
      raise
    end
  end

  def show_errors(obj_name)
    #    row = plsql.select_first(<<-SQL, plsql.schema_name, obj_name.upcase)
    #      select * from all_errors where owner = :owner and name = :obj_name
    #    SQL
    row = plsql.user_errors.all("where name = :obj_name", obj_name.upcase)
    puts row if row
  end

  def src_script_with_extention(name, ext)
    script "src/#{name}.#{ext}"
  end

  def plsql_script(name, ext)
    src_script_with_extention name, ext
    show_errors name
  end

  def package_spec(name)
    plsql_script name, "pks"
  end

  def package_body(name)
    plsql_script name, "pkb"
  end

  def procedure(name)
    plsql_script name, "prc"
  end

  def function(name)
    plsql_script name, "fnc"
  end

  def package(name)
    package_spec name
    package_body name
  end

  def table(name)
    src_script_with_extention name, "tab"
  end

  def sequence(name)
    src_script_with_extention name, "seq"
  end

  def sql(name)
    src_script_with_extention name, "sql"
  end

  def type_spec(name)
    src_script_with_extention name, "tps"
    show_errors name
  end

  def deploy_line(linearr)
    send linearr.first, *linearr.drop(1)
  end

  def deploy_file(filename)
    File.readlines(filename).each { |line| deploy_line line.split }
  end
end
