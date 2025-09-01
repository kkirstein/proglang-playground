Module: dylan-user

define library benchmark-test-suite
  use common-dylan;
  use testworks;
  use benchmark;
end library;

define module benchmark-test-suite
  use common-dylan;
  use testworks;
  use benchmark;
  use benchmark-impl;
end module;
