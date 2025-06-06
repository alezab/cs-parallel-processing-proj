# Nazwa komputera
echo "Hostname:" $(hostname)

# Model procesora
echo "CPU Model:" $(lscpu | awk -F: '/Model name/ {print $2}' | xargs)

# Liczba socketów (CPU)
sockets=$(lscpu | awk -F: '/Socket\(s\)/ {print $2}' | xargs)
echo "Socket(s):" $sockets

# Liczba logicznych rdzeni na fizyczny rdzeń
threads_per_core=$(lscpu | awk -F: '/Thread\(s\) per core/ {print $2}' | xargs)

# Liczba fizycznych rdzeni na socket
cores_per_socket=$(lscpu | awk -F: '/Core\(s\) per socket/ {print $2}' | xargs)
echo "Core(s) per socket:" $cores_per_socket

# Liczba logicznych rdzeni na socket
threads_per_socket=$((threads_per_core * cores_per_socket))
echo "Thread(s) per socket:" $threads_per_socket

# Liczba fizycznych rdzeni ogółem
total_cores=$((cores_per_socket * sockets))
echo "Core(s) total:" $total_cores

# Liczba logicznych rdzeni ogółem
total_threads=$((total_cores * threads_per_core))
echo "Thread(s) total:" $total_threads

# Ilość pamięci RAM
echo "Total RAM:" $(free -h | awk '/^Mem:/ {print $2}')

# System operacyjny
echo "Distro:" $(cat /etc/os-release | grep "PRETTY_NAME" | awk -F= '{print $2}' | xargs)
echo "Kernel:" $(uname -r)
echo "Arch:" $(uname -m)

# Informacje o wersji g++
echo $(g++ --version | head -n 1)

# Informacje o wersji SLURM
echo $(srun --version 2>&1 | head -n 1)