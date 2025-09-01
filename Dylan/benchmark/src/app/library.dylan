Module: dylan-user
Synopsis: Module and library definition for executable application

define library benchmark-app
  use common-dylan;
  use benchmark;
  use io, import: { format-out };
end library;

define module benchmark-app
  use common-dylan;
  use format-out;
  use benchmark;
end module;
