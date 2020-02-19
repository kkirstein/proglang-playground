CAF = caf
MPI = mpif90

.PHONY: all clean

all: images array_copy_mpi array_copy_caf

images: images.f90
		$(CAF) $< -o $@

array_copy_mpi: array_copy_mpi.f90
		$(MPI) $< -o $@

array_copy_caf: array_copy_caf.f90
		$(CAF) $< -o $@

clean:
		$(RM) images array_copy_mpi array_copy_caf
