module Questionable
  class Engine < ::Rails::Engine
    isolate_namespace Questionable
    
    # TODO: Engine migration should run from parent without out coping.
    # FIX: Error on "+=" operator, fix so migrations run in engine.
    # initializer :append_migrations do |app|
    #   unless app.root.to_s.match root.to_s
    #     app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
    #   end
    # end
  end
end
