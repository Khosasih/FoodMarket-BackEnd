<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('User') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="mb-10">
                <a href="{{ route('users.create') }}" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                    <i class="fa-solid fa-user-plus"></i> Create User
                </a>
            </div>
            <div class="bg-white">
                <table class="table auto w-full">
                    <thead>
                        <tr>
                            <th class="border px-6 py-4">ID</th>
                            <th class="border px-6 py-4">Name</th>
                            <th class="border px-6 py-4">Email</th>
                            <th class="border px-6 py-4">Roles</th>
                            <th class="border px-6 py-4">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($user as $item)
                        <tr>
                            <td class="border px-6 py-4">{{ ++$i }}</td>
                            <td class="border px-6 py-4">{{ $item->name }}</td>
                            <td class="class border px-6 py-4">{{ $item->email }}</td>
                            <td class="class border px-6 py-4">{{ $item->roles }}</td>
                            <td class="border px-6 py-4 text-center">
                                <a href="{{ route('users.edit', $item->id) }}" class="inline-block bg-orange-500 hover:bg-orange-700 px-6 py-2 text-white font-bold rounded">
                                       <i class="fa-solid fa-pencil"></i> Edit
                                </a>
                                <form action="{{ route('users.destroy', $item->id) }}" method="POST" class="inline-block">
                                    {!! method_field('delete') . csrf_field() !!}
                                <button type="submit" class="bg-red-500 hover:bg-red-700 px-6 py-2 text-white font-bold rounded">
                                    <i class="fa-solid fa-trash-can"></i> Delete
                                </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="border text-center p-5">
                                Data tidak ditemukan
                            </td>
                        </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="text-center mt-5">
                    {{ $user->links() }}
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
