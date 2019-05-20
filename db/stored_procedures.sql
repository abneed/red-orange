--Stored Procedures
ALTER TABLE Employees ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE Employees ALTER COLUMN updated_at SET DEFAULT NOW();
ALTER TABLE Employees ALTER COLUMN date_of_hire SET DEFAULT NOW();
ALTER TABLE Dominates ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE Dominates ALTER COLUMN updated_at SET DEFAULT NOW();
ALTER TABLE Skills ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE Skills ALTER COLUMN updated_at SET DEFAULT NOW();
ALTER TABLE Users ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE Users ALTER COLUMN updated_at SET DEFAULT NOW();
ALTER TABLE Items ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE Items ALTER COLUMN updated_at SET DEFAULT NOW();

--Employee

  --employee_get_all
  CREATE OR REPLACE FUNCTION employee_get_all()
  RETURNS TABLE 
  (
    id BIGINT,
    name VARCHAR,
    job_title VARCHAR,
    subsidiary VARCHAR,
    department VARCHAR,
    currency VARCHAR,
    phone VARCHAR,
    date_of_hire DATE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Employees ORDER BY Employees.id ASC;
  END;
  $$ LANGUAGE plpgsql;

  --employee_get_by_id
  CREATE OR REPLACE FUNCTION employee_get_by_id(employee_id INT)
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    job_title VARCHAR,
    subsidiary VARCHAR,
    department VARCHAR,
    currency VARCHAR,
    phone VARCHAR,
    date_of_hire DATE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Employees AS e
    WHERE e.id = employee_id;
  END;
  $$ LANGUAGE plpgsql;

  --employee_create
  CREATE OR REPLACE PROCEDURE employee_create
  (
    new_name VARCHAR,
    new_job_title VARCHAR,
    new_subsidiary VARCHAR,
    new_department VARCHAR,
    new_currency VARCHAR,
    new_phone VARCHAR
  )
  LANGUAGE SQL
  AS $$
  INSERT INTO Employees (
    name,
    job_title,
    subsidiary,
    department,
    currency,
    phone
    )
    VALUES (
      new_name,
      new_job_title,
      new_subsidiary,
      new_department,
      new_currency,
      new_phone
    );
  $$;

  --employee_update
  CREATE OR REPLACE PROCEDURE employee_update
  (
    employee_id INT,
    new_name VARCHAR,
    new_job_title VARCHAR,
    new_subsidiary VARCHAR,
    new_department VARCHAR,
    new_currency VARCHAR,
    new_phone VARCHAR
  )
  LANGUAGE SQL
  AS $$
  UPDATE Employees SET
  name = coalesce(new_name, Employees.name),
  job_title = coalesce(new_job_title, Employees.job_title),
  subsidiary = coalesce(new_subsidiary, Employees.subsidiary),
  department = coalesce(new_department, Employees.department),
  currency = coalesce(new_currency, Employees.currency),
  phone = coalesce(new_phone, Employees.phone),
  updated_at = NOW()
  WHERE Employees.id = employee_id;
  $$;

  --employee_delete
  CREATE OR REPLACE PROCEDURE employee_delete(delete_employee_id INT)
  LANGUAGE plpgsql
  AS $$
  BEGIN
    DELETE FROM Dominates WHERE Dominates.employee_id = delete_employee_id;
    DELETE FROM Employees WHERE Employees.id = delete_employee_id;
    COMMIT;
  END
  $$;

  --employee_get_last_created
  CREATE OR REPLACE FUNCTION employee_get_last_created()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    job_title VARCHAR,
    subsidiary VARCHAR,
    department VARCHAR,
    currency VARCHAR,
    phone VARCHAR,
    date_of_hire DATE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Employees AS e
    ORDER BY e.created_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

  --employee_get_last_updated
  CREATE OR REPLACE FUNCTION employee_get_last_updated()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    job_title VARCHAR,
    subsidiary VARCHAR,
    department VARCHAR,
    currency VARCHAR,
    phone VARCHAR,
    date_of_hire DATE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Employees AS e
    ORDER BY e.updated_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

--Items

  --item_get_all
  CREATE OR REPLACE FUNCTION item_get_all()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    description VARCHAR,
    quantity INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Items
    ORDER BY Items.id ASC;
  END;
  $$ LANGUAGE plpgsql;

  --item_get_by_id
  CREATE OR REPLACE FUNCTION item_get_by_id(item_id INT)
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    description VARCHAR,
    quantity INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Items AS i
    WHERE i.id = item_id;
  END;
  $$ LANGUAGE plpgsql;

  --item_create
  CREATE OR REPLACE PROCEDURE item_create
  (
    new_name VARCHAR,
    new_description VARCHAR,
    new_quantity INT
  )
  LANGUAGE SQL
  AS $$
    INSERT INTO Items (name, description, quantity)
  VALUES
  (
    new_name,
    new_description,
    new_quantity
  );
  $$;

  --item_update
  CREATE OR REPLACE PROCEDURE item_update
  (
    item_id INT,
    new_name VARCHAR,
    new_description VARCHAR,
    new_quantity INT
  )
  LANGUAGE SQL 
  AS $$
    UPDATE Items SET
    name = coalesce(new_name, Items.name),
    description = coalesce(new_description, Items.description),
    quantity = coalesce(new_quantity, Items.quantity),
    updated_at = NOW()
    WHERE Items.id = item_id;
  $$;

  --item_delete
  CREATE OR REPLACE PROCEDURE item_delete(item_id INT)
  LANGUAGE SQL
  AS $$
    DELETE FROM Items WHERE Items.id = item_id;
  $$;

  --item_get_last_created
  CREATE OR REPLACE FUNCTION item_get_last_created()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    description VARCHAR,
    quantity INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Items AS i
    ORDER BY i.created_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

--item_get_last_updated
  CREATE OR REPLACE FUNCTION item_get_last_updated()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    description VARCHAR,
    quantity INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Items AS i
    ORDER BY i.updated_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

--Skill

  --skill_get_all
  CREATE OR REPLACE FUNCTION skill_get_all()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    description TEXT,
    degree_of_difficulty INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Skills ORDER BY Skills.id ASC;
  END;
  $$ LANGUAGE plpgsql;

  --skill_get_by_id
  CREATE OR REPLACE FUNCTION skill_get_by_id(skill_id INT) 
  RETURNS TABLE 
  (
    id BIGINT,
    name VARCHAR,
    description TEXT,
    degree_of_difficulty INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Skills AS s
    WHERE s.id = skill_id;
  END;
  $$ LANGUAGE plpgsql;

  --skill_create
  CREATE OR REPLACE PROCEDURE skill_create
  (
    new_name VARCHAR,
    new_description VARCHAR,
    new_degree_of_difficulty INT
  )
  LANGUAGE SQL
  AS $$
  INSERT INTO Skills (name, description, degree_of_difficulty)
  VALUES
  (
    new_name,
    new_description,
    new_degree_of_difficulty
  );
  $$;
  
  --skill_update
  CREATE OR REPLACE PROCEDURE skill_update
  (
    skill_id INT,
    new_name VARCHAR,
    new_description VARCHAR,
    new_degree_of_difficulty INT
  )
  LANGUAGE SQL
  AS $$
  UPDATE Skills SET
  name = coalesce(new_name, Skills.name),
  description = coalesce(new_description, Skills.description),
  degree_of_difficulty = coalesce(new_degree_of_difficulty, Skills.degree_of_difficulty),
  updated_at = NOW()
  WHERE Skills.id = skill_id;
  $$;

  --skill_delete  
  CREATE OR REPLACE PROCEDURE skill_delete(delete_skill_id INT)
  LANGUAGE plpgsql
  AS $$
  BEGIN
    DELETE FROM Dominates WHERE Dominates.skill_id = delete_skill_id;
    DELETE FROM Skills WHERE Skills.id = delete_skill_id;
    COMMIT;
  END
  $$;

  --skill_get_last_created
  CREATE OR REPLACE FUNCTION skill_get_last_created()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    description TEXT,
    degree_of_difficulty INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Skills AS s
    ORDER BY s.created_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

  --skill_get_last_updated
 CREATE OR REPLACE FUNCTION skill_get_last_updated()
  RETURNS TABLE
  (
    id BIGINT,
    name VARCHAR,
    description TEXT,
    degree_of_difficulty INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Skills AS s
    ORDER BY s.updated_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

--Dominate

  --dominate_get_all
  CREATE OR REPLACE FUNCTION dominate_get_all()
  RETURNS TABLE
  (
    id BIGINT,
    employee_id BIGINT,
    skill_id BIGINT,
    degree_of_dominance INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Dominates;
  END;
  $$ LANGUAGE plpgsql;

  --dominate_get_by_id
  CREATE OR REPLACE FUNCTION dominate_get_by_id(dominate_id INT)
  RETURNS TABLE
  (
    id BIGINT,
    employee_id BIGINT,
    skill_id BIGINT,
    degree_of_dominance INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Dominates AS d
    WHERE d.id = dominate_id;
  END;
  $$ LANGUAGE plpgsql;

  --dominate_get_by_employee_id
  CREATE OR REPLACE FUNCTION dominate_get_by_employee_id(emp_id INT)
  RETURNS TABLE
  (
    id BIGINT,
    employee_id BIGINT,
    skill_id BIGINT,
    degree_of_dominance INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Dominates AS d
    WHERE d.employee_id = emp_id;
  END;
  $$ LANGUAGE plpgsql;
  
  --dominate_create
  CREATE OR REPLACE PROCEDURE dominate_create
  (
    new_employee_id BIGINT,
    new_skill_id BIGINT,
    new_degree_of_dominance INT
  )
  LANGUAGE SQL
  AS $$
  INSERT INTO Dominates (employee_id, skill_id, degree_of_dominance)
  VALUES
  (
    new_employee_id,
    new_skill_id,
    new_degree_of_dominance
  );
  $$;

  --dominate_update
  CREATE OR REPLACE PROCEDURE dominate_update
  (
    dominate_id BIGINT,
    new_employee_id BIGINT,
    new_skill_id BIGINT,
    new_degree_of_dominance INT
  )
  LANGUAGE SQL
  AS $$
  UPDATE Dominates SET
  employee_id = coalesce(new_employee_id, Dominates.employee_id),
  skill_id = coalesce(new_skill_id, Dominates.skill_id),
  degree_of_dominance = coalesce(new_degree_of_dominance, Dominates.degree_of_dominance),
  updated_at = NOW()
  WHERE Dominates.id = dominate_id;
  $$;

  --dominate_delete
  CREATE OR REPLACE PROCEDURE dominate_delete(dominate_id INT)
  LANGUAGE SQL
  AS $$
    DELETE FROM Dominates WHERE Dominates.id = dominate_id;
  $$;

  --dominate_get_last_created
  CREATE OR REPLACE FUNCTION dominate_get_last_created()
  RETURNS TABLE
  (
    id BIGINT,
    employee_id BIGINT,
    skill_id BIGINT,
    degree_of_dominance INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Dominates AS d
    ORDER BY d.created_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

  --dominate_get_last_updated
  CREATE OR REPLACE FUNCTION dominate_get_last_updated()
  RETURNS TABLE
  (
    id BIGINT,
    employee_id BIGINT,
    skill_id BIGINT,
    degree_of_dominance INT,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Dominates AS d
    ORDER BY d.updated_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

--User

  --user_get_all
  CREATE OR REPLACE FUNCTION user_get_all()
  RETURNS TABLE
  (
    id BIGINT,
    email VARCHAR,
    encrypted_password VARCHAR,
    reset_password_token VARCHAR,
    reset_password_sent_at TIMESTAMP WITHOUT TIME ZONE,
    remember_created_at TIMESTAMP WITHOUT TIME ZONE,
    name VARCHAR,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Users;
  END;
  $$ LANGUAGE plpgsql;

  --user_get_by_id
  CREATE OR REPLACE FUNCTION user_get_by_id(user_id INT)
  RETURNS TABLE
  (
    id BIGINT,
    email VARCHAR,
    encrypted_password VARCHAR,
    reset_password_token VARCHAR,
    reset_password_sent_at TIMESTAMP WITHOUT TIME ZONE,
    remember_created_at TIMESTAMP WITHOUT TIME ZONE,
    name VARCHAR,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Users AS u
    WHERE u.id = user_id;
  END;
  $$ LANGUAGE plpgsql;

  --user_create
  CREATE OR REPLACE PROCEDURE user_create
  (
    new_email VARCHAR,
    new_encrypted_password VARCHAR,
    new_name VARCHAR
  )
  LANGUAGE SQL
  AS $$
  INSERT INTO Users 
  (
    email,
    encrypted_password,
    name
  )
  VALUES
  (
    new_email,
    new_encrypted_password,
    new_name
  );
  $$;

  --user_update
  CREATE OR REPLACE PROCEDURE user_update
  (
    user_id BIGINT,
    new_email VARCHAR,
    new_encrypted_password VARCHAR,
    new_name VARCHAR
  )
  LANGUAGE SQL
  AS $$
  UPDATE Users SET
  email = coalesce(new_email, Users.email),
  encrypted_password = coalesce(new_encrypted_password, Users.encrypted_password),
  name = coalesce(new_name, Users.name),
  updated_at = NOW()
  WHERE Users.id = user_id;
  $$;

  --user_delete
  CREATE OR REPLACE PROCEDURE user_delete(user_id INT)
  LANGUAGE SQL
  AS $$
    DELETE FROM Users WHERE Users.id = user_id;
  $$;

  --user_get_last_created
  CREATE OR REPLACE FUNCTION user_get_last_created()
  RETURNS TABLE
  (
    id BIGINT,
    email VARCHAR,
    encrypted_password VARCHAR,
    reset_password_token VARCHAR,
    reset_password_sent_at TIMESTAMP WITHOUT TIME ZONE,
    remember_created_at TIMESTAMP WITHOUT TIME ZONE,
    name VARCHAR,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Users AS u
    ORDER BY u.created_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

  --user_get_last_updated
  CREATE OR REPLACE FUNCTION user_get_last_updated()
  RETURNS TABLE
  (
    id BIGINT,
    email VARCHAR,
    encrypted_password VARCHAR,
    reset_password_token VARCHAR,
    reset_password_sent_at TIMESTAMP WITHOUT TIME ZONE,
    remember_created_at TIMESTAMP WITHOUT TIME ZONE,
    name VARCHAR,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
  ) AS $$
  BEGIN
    RETURN QUERY SELECT * FROM Users AS u
    ORDER BY u.updated_at DESC LIMIT 1;
  END;
  $$ LANGUAGE plpgsql;

-- For graphics

  --average_degree_of_dominance
  CREATE OR REPLACE FUNCTION average_degree_of_dominance()
  RETURNS TABLE
  (
    skills_name VARCHAR,
    average_degree_of_dominance NUMERIC
  ) AS $$
  BEGIN
    RETURN QUERY SELECT 
    Skills.name AS skills_name,
    AVG(degree_of_dominance) AS average_degree_of_dominance
    FROM Skills
    INNER JOIN Dominates ON Dominates.skill_id = skills.id 
    GROUP BY Skills.name;
  END;
  $$ LANGUAGE plpgsql;
  
  --sum_quantity_items
  CREATE OR REPLACE FUNCTION sum_quantity_items()
  RETURNS TABLE
  (
    sum_quantity BIGINT,
    items_name VARCHAR
  ) AS $$
  BEGIN
  RETURN QUERY SELECT 
  SUM(Items.quantity) AS sum_quantity, 
  Items.name AS items_name 
  FROM Items
  GROUP BY Items.name;
  END;
  $$ LANGUAGE plpgsql;